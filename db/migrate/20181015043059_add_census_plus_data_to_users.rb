class AddCensusPlusDataToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :census_plus_data, :string
  end
end
