class RemoveCensusPlusDatumIdFromPlayer < ActiveRecord::Migration[5.2]
  def change
    remove_column :players, :census_plus_datum_id, :integer
  end
end
