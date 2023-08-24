require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "should get profile" do
    get user_profile_path
    assert_response :success
  end
end
