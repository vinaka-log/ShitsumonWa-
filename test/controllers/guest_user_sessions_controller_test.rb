require 'test_helper'

class GuestUserSessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get guest_user_sessions_create_url
    assert_response :success
  end

end
