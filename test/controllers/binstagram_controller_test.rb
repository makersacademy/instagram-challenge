require 'test_helper'

class BinstagramControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get binstagram_index_url
    assert_response :success
  end

end
