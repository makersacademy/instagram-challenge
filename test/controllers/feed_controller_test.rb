require 'test_helper'

class FeedControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get feed_new_url
    assert_response :success
  end

  test "should get create" do
    get feed_create_url
    assert_response :success
  end

  test "should get update" do
    get feed_update_url
    assert_response :success
  end

  test "should get edit" do
    get feed_edit_url
    assert_response :success
  end

end
