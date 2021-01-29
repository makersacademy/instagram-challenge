require "test_helper"

class Post::CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post_comment = post_comments(:one)
  end

  test "should get index" do
    get post_comments_url
    assert_response :success
  end

  test "should get new" do
    get new_post_comment_url
    assert_response :success
  end

  test "should create post_comment" do
    assert_difference('Post::Comment.count') do
      post post_comments_url, params: { post_comment: { comments: @post_comment.comments, post_id: @post_comment.post_id, user_id: @post_comment.user_id } }
    end

    assert_redirected_to post_comment_url(Post::Comment.last)
  end

  test "should show post_comment" do
    get post_comment_url(@post_comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_post_comment_url(@post_comment)
    assert_response :success
  end

  test "should update post_comment" do
    patch post_comment_url(@post_comment), params: { post_comment: { comments: @post_comment.comments, post_id: @post_comment.post_id, user_id: @post_comment.user_id } }
    assert_redirected_to post_comment_url(@post_comment)
  end

  test "should destroy post_comment" do
    assert_difference('Post::Comment.count', -1) do
      delete post_comment_url(@post_comment)
    end

    assert_redirected_to post_comments_url
  end
end
