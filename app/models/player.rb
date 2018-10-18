class Player < ApplicationRecord
  has_and_belongs_to_many :census_plus_data
  belongs_to :server

  validates :faction, presence: true
  validates :race, presence: true
  validates :klass, presence: true
  validates :name, presence: true
  validates :level, presence: true

  def self.server_to_players(server)
    players = []
    server.each do |faction, values|
      values.each do |race, values|
        values.each do |pclass, values|
          values.each do |pname, values|
            level, guild_name, *last_seen = values
            players << Player.new(
              faction: faction,
              race: race,
              klass: pclass,
              name: pname,
              level: level,
              guild_name: guild_name
            )
          end
        end
      end
    end
    return players
  end
end
