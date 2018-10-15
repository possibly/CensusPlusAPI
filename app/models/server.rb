class Server < ApplicationRecord
  belongs_to :census_plus_datum
  has_many :players
  has_many :guilds

  validates :name, presence: true

  def self.data_to_servers(servers)
    servers.keys.map { |name| Server.find_by_or_create_by(name: name) }
  end
end
