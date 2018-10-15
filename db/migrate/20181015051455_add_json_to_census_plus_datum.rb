class AddJsonToCensusPlusDatum < ActiveRecord::Migration[5.2]
  def change
    add_column :census_plus_data, :json, :string
  end
end
