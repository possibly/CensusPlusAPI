# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_10_18_030507) do

  create_table "census_plus_data", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "file"
    t.integer "user_id"
    t.index ["user_id"], name: "index_census_plus_data_on_user_id"
  end

  create_table "census_plus_data_guilds", id: false, force: :cascade do |t|
    t.integer "census_plus_datum_id", null: false
    t.integer "guild_id", null: false
    t.index ["census_plus_datum_id"], name: "index_census_plus_data_guilds_on_census_plus_datum_id"
    t.index ["guild_id"], name: "index_census_plus_data_guilds_on_guild_id"
  end

  create_table "census_plus_data_players", id: false, force: :cascade do |t|
    t.integer "census_plus_datum_id", null: false
    t.integer "player_id", null: false
    t.index ["census_plus_datum_id"], name: "index_census_plus_data_players_on_census_plus_datum_id"
    t.index ["player_id"], name: "index_census_plus_data_players_on_player_id"
  end

  create_table "census_plus_data_servers", id: false, force: :cascade do |t|
    t.integer "census_plus_datum_id", null: false
    t.integer "server_id", null: false
    t.index ["census_plus_datum_id"], name: "index_census_plus_data_servers_on_census_plus_datum_id"
    t.index ["server_id"], name: "index_census_plus_data_servers_on_server_id"
  end

  create_table "characters", force: :cascade do |t|
    t.integer "census_plus_data_id"
    t.integer "server_id"
    t.string "faction"
    t.string "race"
    t.string "class"
    t.string "name"
    t.integer "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["census_plus_data_id"], name: "index_characters_on_census_plus_data_id"
    t.index ["server_id"], name: "index_characters_on_server_id"
  end

  create_table "guilds", force: :cascade do |t|
    t.integer "server_id"
    t.string "name"
    t.string "faction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["server_id"], name: "index_guilds_on_server_id"
  end

  create_table "players", force: :cascade do |t|
    t.integer "server_id"
    t.string "faction"
    t.string "race"
    t.string "klass"
    t.string "name"
    t.integer "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "guild_id"
    t.string "guild_rank"
    t.integer "guild_rank_index"
    t.string "guild_name"
    t.index ["guild_id"], name: "index_players_on_guild_id"
    t.index ["server_id"], name: "index_players_on_server_id"
  end

  create_table "servers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
