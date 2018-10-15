class CensusPlusDatum < ApplicationRecord
  mount_base64_uploader :census_plus_data, CensusPlusDataUploader
end
