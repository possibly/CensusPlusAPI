require 'CensusPlusReader.rb'

class CensusPlusDatum < ApplicationRecord
  after_save :file_to_json

  mount_base64_uploader :file, CensusPlusFileUploader, :dependent => :destroy

  private
    def file_to_json
      assign_attributes(:json => CensusPlusReader.to_json(self.file.path))
    end
end
