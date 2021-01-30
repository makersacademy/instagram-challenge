require "test_helper"

class PicturesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pictures_index_url
    assert_response :success
  end
end
