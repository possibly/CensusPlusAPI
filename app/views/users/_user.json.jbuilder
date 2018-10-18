json.extract! user, :id, :census_plus_data, :servers, :players, :guilds, :created_at, :updated_at
json.url user_url(user, format: :json)
