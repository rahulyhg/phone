require 'test_helper'

class EmployeeMailerTest < ActionMailer::TestCase
  # test "the truth" do
  #   assert true
  # end
	 test "invite" do
	  # Send the email, then test that it got queued
	  email = UserMailer.create_invite('me@example.com',
	                                   'd.litz@lifecodexx.com', Time.now).deliver_now
	  assert_not ActionMailer::Base.deliveries.empty?

	  # Test the body of the sent email contains what we expect it to
	  assert_equal ['me@example.com'], email.from
	  assert_equal ['d.litz@lifecodexx.com'], email.to
	  assert_equal 'You have been invited by me@example.com', email.subject
	  assert_equal read_fixture('invite').join, email.body.to_s
	end
end
