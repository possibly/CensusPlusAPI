class RemoveCensusPlusDatumIdFromGuild < ActiveRecord::Migration[5.2]
  def change
    remove_column :guilds, :census_plus_datum_id, :integer
  end
end
