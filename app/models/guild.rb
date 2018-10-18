class Guild < ApplicationRecord
  belongs_to :server
  has_and_belongs_to_many :census_plus_data
  has_many :players

  def self.server_to_guilds(server, server_id)
    guilds = []
    server.each do |faction, values|
      values.each do |gname, values|
        guilds << Guild.find_or_create_by(
          name: gname,
          faction: faction,
          server_id: server_id
        )
      end
    end
    return guilds
  end

  def members_data(census)
    census["Guilds"][self.server.name][self.faction][self.name]["Members"]
  end
end
