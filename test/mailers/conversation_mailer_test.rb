require 'test_helper'

class ConversationMailerTest < ActionMailer::TestCase
  test "notification" do
    mail = ConversationMailer.notification
    assert_equal "Notification", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
