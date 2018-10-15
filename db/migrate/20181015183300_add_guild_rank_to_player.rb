class AddGuildRankToPlayer < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :guild_rank, :string
  end
end
