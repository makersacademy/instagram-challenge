require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup do
    @post = posts(:one)
    @comment = comments(:one)
  end

  test "should get index" do
    get :index, params: { post_id: @post }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { post_id: @post }
    assert_response :success
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post :create, params: { post_id: @post, comment: @comment.attributes }
    end

    assert_redirected_to post_comment_path(@post, Comment.last)
  end

  test "should show comment" do
    get :show, params: { post_id: @post, id: @comment }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { post_id: @post, id: @comment }
    assert_response :success
  end

  test "should update comment" do
    put :update, params: { post_id: @post, id: @comment, comment: @comment.attributes }
    assert_redirected_to post_comment_path(@post, Comment.last)
  end

  test "should destroy comment" do
    assert_difference('Comment.count', -1) do
      delete :destroy, params: { post_id: @post, id: @comment }
    end

    assert_redirected_to post_comments_path(@post)
  end
end
