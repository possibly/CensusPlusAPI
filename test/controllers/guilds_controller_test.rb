require 'test_helper'

class GuildsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @guild = guilds(:one)
  end

  test "should get index" do
    get guilds_url, as: :json
    assert_response :success
  end

  test "should create guild" do
    assert_difference('Guild.count') do
      post guilds_url, params: { guild: { census_plus_datum: @guild.census_plus_datum, server_id: @guild.server_id } }, as: :json
    end

    assert_response 201
  end

  test "should show guild" do
    get guild_url(@guild), as: :json
    assert_response :success
  end

  test "should update guild" do
    patch guild_url(@guild), params: { guild: { census_plus_datum: @guild.census_plus_datum, server_id: @guild.server_id } }, as: :json
    assert_response 200
  end

  test "should destroy guild" do
    assert_difference('Guild.count', -1) do
      delete guild_url(@guild), as: :json
    end

    assert_response 204
  end
end
