class AddUserToServer < ActiveRecord::Migration[5.2]
  def change
    add_reference :servers, :user, foreign_key: true
  end
end
