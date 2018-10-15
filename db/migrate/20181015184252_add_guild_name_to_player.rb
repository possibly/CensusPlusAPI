class AddGuildNameToPlayer < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :guild_name, :string
  end
end
