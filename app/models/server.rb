class Server < ApplicationRecord
  belongs_to :census_plus_datum

  validates :name, presence: true
  validates :census_plus_datum, presence: true

  def self.data_to_servers(servers)
    servers.keys.map { |name| Server.new(name: name) }
  end
end
