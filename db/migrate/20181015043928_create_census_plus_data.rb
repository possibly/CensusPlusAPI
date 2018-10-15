class CreateCensusPlusData < ActiveRecord::Migration[5.2]
  def change
    create_table :census_plus_data do |t|

      t.timestamps
    end
  end
end
