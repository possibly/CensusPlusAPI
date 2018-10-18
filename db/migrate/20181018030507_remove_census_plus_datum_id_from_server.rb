class RemoveCensusPlusDatumIdFromServer < ActiveRecord::Migration[5.2]
  def change
    remove_column :servers, :census_plus_datum_id, :integer
  end
end
