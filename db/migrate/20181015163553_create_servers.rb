class CreateServers < ActiveRecord::Migration[5.2]
  def change
    create_table :servers do |t|
      t.string :name
      t.belongs_to :census_plus_datum, foreign_key: true

      t.timestamps
    end
  end
end
