json.extract! player, :id, :census_plus_datum_id, :server_id, :faction, :race, :klass, :name, :level, :guild_name, :guild_rank, :guild_rank_index, :created_at, :updated_at
json.url player_url(player, format: :json)
