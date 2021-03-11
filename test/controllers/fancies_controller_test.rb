require 'test_helper'

class FanciesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get fancies_create_url
    assert_response :success
  end

end
