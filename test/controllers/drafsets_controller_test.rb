require 'test_helper'

class DrafsetsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get drafsets_new_url
    assert_response :success
  end

  test "should get create" do
    get drafsets_create_url
    assert_response :success
  end

  test "should get show" do
    get drafsets_show_url
    assert_response :success
  end

  test "should get edit" do
    get drafsets_edit_url
    assert_response :success
  end

  test "should get update" do
    get drafsets_update_url
    assert_response :success
  end

  test "should get destroy" do
    get drafsets_destroy_url
    assert_response :success
  end

end
