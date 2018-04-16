require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get front" do
    get home_front_url
    assert_response :success
  end

end
