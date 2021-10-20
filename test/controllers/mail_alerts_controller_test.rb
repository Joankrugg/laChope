require 'test_helper'

class MailAlertsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get mail_alerts_new_url
    assert_response :success
  end

  test "should get create" do
    get mail_alerts_create_url
    assert_response :success
  end

end
