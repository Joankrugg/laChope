require 'test_helper'

class PublicSearchesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_searches_new_url
    assert_response :success
  end

  test "should get create" do
    get public_searches_create_url
    assert_response :success
  end

  test "should get show" do
    get public_searches_show_url
    assert_response :success
  end

end
