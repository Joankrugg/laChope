require 'test_helper'

class AccessesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get accesses_new_url
    assert_response :success
  end

  test "should get create" do
    get accesses_create_url
    assert_response :success
  end

  test "should get show" do
    get accesses_show_url
    assert_response :success
  end

  test "should get edit" do
    get accesses_edit_url
    assert_response :success
  end

  test "should get update" do
    get accesses_update_url
    assert_response :success
  end

end
