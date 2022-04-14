require 'test_helper'

class TastingPlaceControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tasting_place_index_url
    assert_response :success
  end

end
