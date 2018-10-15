class Player < ApplicationRecord
  belongs_to :census_plus_datum
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
            values.each do |level, guild_name, **last_seen|
              players << Player.new(
                faction: faction,
                race: race,
                klass: pclass,
                name: pname,
                level: level
              )
            end
          end
        end
      end
    end
    return players
  end
end
