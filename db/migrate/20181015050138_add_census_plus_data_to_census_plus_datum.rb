class AddCensusPlusDataToCensusPlusDatum < ActiveRecord::Migration[5.2]
  def change
    add_column :census_plus_data, :file, :string
  end
end
