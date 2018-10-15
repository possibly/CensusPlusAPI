class Guild < ApplicationRecord
  belongs_to :server
  belongs_to :census_plus_datum
  has_many :players

  def self.server_to_guilds(server)
    guilds = []
    server.each do |faction, values|
      values.each do |gname, values|
        guilds << Guild.new(
          name: gname,
          faction: faction,
        )
      end
    end
    return guilds
  end

  def members_data(census)
    census["Guilds"][self.server.name][self.faction][self.name]["Members"]
  end
end
