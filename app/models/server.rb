class Server < ApplicationRecord
  has_and_belongs_to_many :census_plus_data
  has_many :players
  has_many :guilds
  belongs_to :user

  validates :name, presence: true

  def self.get_params(census)
    self.census_servers(census).keys.each do |server_name|
      yield(server_name)
    end
  end

  def self.census_servers(census)
    census["Servers"]
  end
end
