class AddUserToCensusPlusDatum < ActiveRecord::Migration[5.2]
  def change
    add_reference :census_plus_data, :user, foreign_key: true
  end
end
