class CreateDataPlayersJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :census_plus_data, :players do |t|
      t.index :census_plus_datum_id
      t.index :player_id
    end
  end
end
