require 'test_helper'

class PhotoControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get photo_new_url
    assert_response :success
  end

  test "should get create" do
    get photo_create_url
    assert_response :success
  end

  test "should get update" do
    get photo_update_url
    assert_response :success
  end

  test "should get edit" do
    get photo_edit_url
    assert_response :success
  end

end
