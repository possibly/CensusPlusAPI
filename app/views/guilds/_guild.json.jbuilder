json.extract! guild, :id, :server, :user, :name, :faction, :players, :created_at, :updated_at
json.url guild_url(guild, format: :json)
