class CreateDataGuildsJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :census_plus_data, :guilds do |t|
      t.index :census_plus_datum_id
      t.index :guild_id
    end
  end
end
