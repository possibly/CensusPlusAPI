class CreateDataServersJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :census_plus_data, :servers do |t|
      t.index :census_plus_datum_id
      t.index :server_id
    end
  end
end
