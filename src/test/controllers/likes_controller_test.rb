require "test_helper"

class LikesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get likes_index_url
    assert_response :success
  end
end
