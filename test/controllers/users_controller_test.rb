require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "GET /users/new" do
    get new_user_url
    assert_response :success
  end

  test "POST /users/create" do
    user = User.new
    assert_not user.save
  end
end
