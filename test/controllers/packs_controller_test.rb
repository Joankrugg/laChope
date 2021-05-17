require 'test_helper'

class PacksControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get packs_new_url
    assert_response :success
  end

  test "should get create" do
    get packs_create_url
    assert_response :success
  end

  test "should get show" do
    get packs_show_url
    assert_response :success
  end

end
