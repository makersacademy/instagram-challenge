require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "GET /users/new" do
    get new_user_url
    assert_response :success
  end
end
