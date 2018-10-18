class CensusPlusDatum < ApplicationRecord
  after_save :census_to_json
  after_save :scan_servers
  after_save :scan_guilds
  after_save :scan_players

  has_and_belongs_to_many :servers
  has_and_belongs_to_many :guilds
  has_many :players
  belongs_to :user

  before_destroy { servers.clear }
  before_destroy { players.clear }
  before_destroy { guilds.clear }

  mount_base64_uploader :file, CensusPlusFileUploader, :dependent => :destroy

  private
    def census_to_json
      @census = Censusplusreader.to_json(self.file.path)
    end

    def scan_servers
      # Only one Server per User and name.
      Server.get_params(@census) do |server_name|
        self.servers << Server.find_or_create_by!(name: server_name, user_id: self.user.id)
      end
    end

    def scan_guilds
      # Only one Guild per Server, name and faction.
      Guild.get_params(@census) do |guild_params, server_name|
        guild_params = guild_params.merge({
          server_id: Server.find_by_name(server_name).id
        })
        self.guilds << Guild.find_or_create_by!(guild_params)
      end
    end

    def scan_players
      # A new player is going to be generated if any piece of their info changes.
      # Commonly, their level and guild will change.
      # Its really up to the consumer to figure out what makes a player "unique".
      # If the consumer determines a unique way of identifying a player,
      # (say, by their name), then sorting players by their :created_at
      # timestamp will enable the consumer to track a players change over time.
      Player.get_params(@census) do |player_params, server_name|
        server_id = Server.find_by_name(server_name).id
        guild = Guild.find_or_create_by!(
          server_id: server_id, 
          name: player_params['guild_name'],
          faction: player_params['faction']
        )
        if guild.changed?
          self.guilds << guild
        end
        guild_id = guild.id
        player_params = player_params.merge({
          server_id: server_id,
          guild_id: guild_id,
          census_plus_datum_id: self.id
        })
        player = Player.find_or_create_by!(player_params)
      end
    end
end
