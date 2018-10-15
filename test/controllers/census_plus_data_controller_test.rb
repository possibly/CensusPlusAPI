require 'test_helper'

class CensusPlusDataControllerTest < ActionDispatch::IntegrationTest
  setup do
    @census_plus_datum = census_plus_data(:one)
  end

  test "should get index" do
    get census_plus_data_url, as: :json
    assert_response :success
  end

  test "should create census_plus_datum" do
    assert_difference('CensusPlusDatum.count') do
      post census_plus_data_url, params: { census_plus_datum: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show census_plus_datum" do
    get census_plus_datum_url(@census_plus_datum), as: :json
    assert_response :success
  end

  test "should update census_plus_datum" do
    patch census_plus_datum_url(@census_plus_datum), params: { census_plus_datum: {  } }, as: :json
    assert_response 200
  end

  test "should destroy census_plus_datum" do
    assert_difference('CensusPlusDatum.count', -1) do
      delete census_plus_datum_url(@census_plus_datum), as: :json
    end

    assert_response 204
  end
end
