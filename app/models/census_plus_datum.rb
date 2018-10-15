require 'CensusPlusReader.rb'

class CensusPlusDatum < ApplicationRecord
  after_save :census_to_json
  after_save :scan_census

  has_many :servers
  has_many :players

  mount_base64_uploader :file, CensusPlusFileUploader, :dependent => :destroy

  private
    def scan_census
      self.servers << Server.data_to_servers(@census["Servers"])
      self.servers.each do |server|
        players = Player.server_to_players(@census["Servers"][server.name])
        server.players << players
        self.players << players
      end
    end

    def census_to_json
      @census = CensusPlusReader.to_json(self.file.path)
    end
end
