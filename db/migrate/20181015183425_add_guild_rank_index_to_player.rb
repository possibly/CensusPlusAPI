class AddGuildRankIndexToPlayer < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :guild_rank_index, :integer
  end
end
