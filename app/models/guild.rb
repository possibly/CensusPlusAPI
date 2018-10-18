class Guild < ApplicationRecord
  belongs_to :server
  has_and_belongs_to_many :census_plus_data
  has_many :players
  has_one :user, :through => :server

  def self.get_params(census)
    self.census_guilds(census) do |guild_info, server_name|
      guild_info.each do |faction, values|
        values.each do |gname, values|
          yield({
            name: gname,
            faction: faction
          }, server_name)
        end
      end
    end
  end

  def self.census_guilds(census)
    census["Guilds"].keys.each do |server_name|
      yield(census["Guilds"][server_name], server_name)
    end
  end
end
