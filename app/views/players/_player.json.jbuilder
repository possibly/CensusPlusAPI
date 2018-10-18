json.extract! player, :id, :census_plus_datum_id, :server_id, :user, :faction, :race, :klass, :name, :level, :guild_id, :guild_name, :guild_rank, :guild_rank_index, :created_at, :updated_at
json.url player_url(player, format: :json)
