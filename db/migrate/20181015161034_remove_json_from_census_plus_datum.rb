class RemoveJsonFromCensusPlusDatum < ActiveRecord::Migration[5.2]
  def change
    remove_column :census_plus_data, :json, :string
  end
end
