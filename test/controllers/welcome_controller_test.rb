require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get welcome_index_url
    assert_response :success
  end

  test "let's user enter details to create a Makstagram account" do
  end
end
