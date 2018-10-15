class User < ApplicationRecord
  mount_uploader :census_plus_data, CensusPlusDataUploader
end
