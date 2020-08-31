require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::ControllerHelpers
  test "should get index" do
    get welcome_index_url
    assert_response :success
  end

end
