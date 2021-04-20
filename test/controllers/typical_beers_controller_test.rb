require 'test_helper'

class TypicalBeersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get typical_beers_index_url
    assert_response :success
  end

  test "should get new" do
    get typical_beers_new_url
    assert_response :success
  end

  test "should get create" do
    get typical_beers_create_url
    assert_response :success
  end

  test "should get show" do
    get typical_beers_show_url
    assert_response :success
  end

  test "should get edit" do
    get typical_beers_edit_url
    assert_response :success
  end

  test "should get update" do
    get typical_beers_update_url
    assert_response :success
  end

  test "should get destroy" do
    get typical_beers_destroy_url
    assert_response :success
  end

end
