class CensusPlusDatum < ApplicationRecord
  after_save :census_to_json
  after_save :scan_census

  has_many :servers
  has_many :players
  has_many :guilds

  mount_base64_uploader :file, CensusPlusFileUploader, :dependent => :destroy

  private
    def scan_census
      self.servers << Server.data_to_servers(@census["Servers"])
      self.servers.each do |server|
        guilds = Guild.server_to_guilds(@census["Guilds"][server.name])
        server.guilds << guilds
        self.guilds << guilds

        players = Player.server_to_players(@census["Servers"][server.name])
        server.players << players
        self.players << players
      end

      # Its possible to scan a player with a guild name, but CensusPlus never scanned the guild itself.
      # So, recover as much data as possible about the guild from the player's info.
      Guild.where(census_plus_datum: self).each do |guild|
        guild.members_data(@census).each do |player_name, values|
          rank_index = values['RankIndex']
          rank = values['Rank']
          player = Player.find_by(name: player_name, census_plus_datum: self, server_id: guild.server)
          player.update_attributes(
            guild_rank: rank,
            guild_rank_index: rank_index
          ) if player.present?
        end
      end

      # Link players to guilds.
      players.where(census_plus_datum: self).distinct(:guild_name).pluck(:guild_name, :faction).each do |guild_name, faction|
        guild = Guild.find_or_create_by(name: guild_name, faction: faction)
        guild.players << Player.where(guild_name: guild_name, faction: faction, census_plus_datum: self)
      end
    end

    def census_to_json
      @census = Censusplusreader.to_json(self.file.path)
    end
end
