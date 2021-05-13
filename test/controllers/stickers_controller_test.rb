require 'test_helper'

class StickersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get stickers_index_url
    assert_response :success
  end

  test "should get new" do
    get stickers_new_url
    assert_response :success
  end

  test "should get create" do
    get stickers_create_url
    assert_response :success
  end

  test "should get show" do
    get stickers_show_url
    assert_response :success
  end

  test "should get edit" do
    get stickers_edit_url
    assert_response :success
  end

  test "should get update" do
    get stickers_update_url
    assert_response :success
  end

  test "should get destroy" do
    get stickers_destroy_url
    assert_response :success
  end

end
