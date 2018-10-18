json.extract! server, :id, :name, :user, :players, :guilds, :created_at, :updated_at
json.census_plus_data do
  json.id server.census_plus_data.map { |cpd| cpd.id }
end
json.url server_url(server, format: :json)
