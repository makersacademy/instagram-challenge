require 'test_helper'

class PostsControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get posts_controller_new_url
    assert_response :success
  end

  test "should get index" do
    get posts_controller_index_url
    assert_response :success
  end

  test "should get edit" do
    get posts_controller_edit_url
    assert_response :success
  end

  test "should get create" do
    get posts_controller_create_url
    assert_response :success
  end

  test "should get destroy" do
    get posts_controller_destroy_url
    assert_response :success
  end

  test "should get update" do
    get posts_controller_update_url
    assert_response :success
  end

end
