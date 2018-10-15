class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.belongs_to :census_plus_datum, foreign_key: true
      t.belongs_to :server, foreign_key: true
      t.string :faction
      t.string :race
      t.string :klass
      t.string :name
      t.integer :level

      t.timestamps
    end
  end
end
