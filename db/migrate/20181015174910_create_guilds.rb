class CreateGuilds < ActiveRecord::Migration[5.2]
  def change
    create_table :guilds do |t|
      t.belongs_to :census_plus_datum, foreign_key: true
      t.belongs_to :server, foreign_key: true
      t.string :name
      t.string :faction

      t.timestamps
    end
  end
end
