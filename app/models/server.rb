class Server < ApplicationRecord
  has_and_belongs_to_many :census_plus_data
  has_many :players
  has_many :guilds

  validates :name, presence: true

  def self.data_to_servers(servers)
    servers.keys.map { |name| Server.find_or_create_by(name: name) }
  end
end
