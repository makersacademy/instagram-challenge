require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index page" do
    get '/'
    assert_response :success
  end
end

 