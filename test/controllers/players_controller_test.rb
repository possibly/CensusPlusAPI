require 'test_helper'

class PlayersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @player = players(:one)
  end

  test "should get index" do
    get players_url, as: :json
    assert_response :success
  end

  test "should create player" do
    assert_difference('Player.count') do
      post players_url, params: { player: { census_plus_data_id: @player.census_plus_data_id, class: @player.class, faction: @player.faction, level: @player.level, name: @player.name, race: @player.race, server_id: @player.server_id } }, as: :json
    end

    assert_response 201
  end

  test "should show player" do
    get player_url(@player), as: :json
    assert_response :success
  end

  test "should update player" do
    patch player_url(@player), params: { player: { census_plus_data_id: @player.census_plus_data_id, class: @player.class, faction: @player.faction, level: @player.level, name: @player.name, race: @player.race, server_id: @player.server_id } }, as: :json
    assert_response 200
  end

  test "should destroy player" do
    assert_difference('Player.count', -1) do
      delete player_url(@player), as: :json
    end

    assert_response 204
  end
end
