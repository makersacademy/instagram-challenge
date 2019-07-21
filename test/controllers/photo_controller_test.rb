require 'test_helper'

class PhotoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get photo_index_url
    assert_response :success
  end

  test "should get store" do
    get photo_store_url
    assert_response :success
  end

end
