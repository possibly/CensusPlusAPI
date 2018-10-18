class Player < ApplicationRecord
  belongs_to :census_plus_datum
  belongs_to :server
  belongs_to :guild
  has_one :user, :through => :server

  validates :faction, presence: true
  validates :race, presence: true
  validates :klass, presence: true
  validates :name, presence: true

  def self.get_params(census)
    self.census_players(census) do |player_info, server_name|
      player_info.each do |faction, values|
        values.each do |race, values|
          values.each do |pclass, values|
            values.each do |pname, values|
              level, guild_name, *last_seen = values
              rank_index, rank = self.census_guild_member(census, server_name, faction, guild_name, pname)
              yield({
                faction: faction,
                race: race,
                klass: pclass,
                name: pname,
                level: level,
                guild_name: guild_name,
                guild_rank_index: rank_index,
                guild_rank: rank
              }, server_name)
            end
          end
        end
      end
    end
  end

  def self.census_guild_member(census, server_name, faction, guild_name, player_name)
    player_guild = census["Guilds"][server_name][faction][guild_name]
    if player_guild.present?
      player_guild_member_info = census["Guilds"][server_name][faction][guild_name]["Members"][player_name]
      if player_guild_member_info.present?
        return [player_guild_member_info["Rank"], player_guild_member_info["RankIndex"]]
      end
    end
    return ['', '']
  end

  def self.census_players(census)
    census["Servers"].keys.each do |server_name|
      yield(census["Servers"][server_name], server_name)
    end
  end
end
