class AddGuildToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_reference :players, :guild, foreign_key: true
  end
end
