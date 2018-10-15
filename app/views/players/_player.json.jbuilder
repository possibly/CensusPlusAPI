json.extract! player, :id, :census_plus_data_id, :server_id, :faction, :race, :class, :name, :level, :created_at, :updated_at
json.url player_url(player, format: :json)
