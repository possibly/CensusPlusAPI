require 'CensusPlusReader.rb'

class CensusPlusDatum < ApplicationRecord
  after_save :scan_census

  has_many :servers

  mount_base64_uploader :file, CensusPlusFileUploader, :dependent => :destroy

  private
    def scan_census
      data = census_to_json
      self.servers << Server.data_to_servers(data["Servers"])
    end

    def census_to_json
      CensusPlusReader.to_json(self.file.path)
    end
end
