require 'CensusPlusReader.rb'

class CensusPlusDatum < ApplicationRecord
  mount_base64_uploader :file, CensusPlusFileUploader
end
