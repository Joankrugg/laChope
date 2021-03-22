require 'test_helper'

class TastingsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get tastings_create_url
    assert_response :success
  end

  test "should get update" do
    get tastings_update_url
    assert_response :success
  end

end
