require 'test_helper'

class MarketPlacesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get market_places_index_url
    assert_response :success
  end

  test "should get new" do
    get market_places_new_url
    assert_response :success
  end

  test "should get create" do
    get market_places_create_url
    assert_response :success
  end

  test "should get show" do
    get market_places_show_url
    assert_response :success
  end

  test "should get edit" do
    get market_places_edit_url
    assert_response :success
  end

  test "should get update" do
    get market_places_update_url
    assert_response :success
  end

  test "should get destroy" do
    get market_places_destroy_url
    assert_response :success
  end

end
