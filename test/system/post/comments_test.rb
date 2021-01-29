require "application_system_test_case"

class Post::CommentsTest < ApplicationSystemTestCase
  setup do
    @post_comment = post_comments(:one)
  end

  test "visiting the index" do
    visit post_comments_url
    assert_selector "h1", text: "Post/Comments"
  end

  test "creating a Comment" do
    visit post_comments_url
    click_on "New Post/Comment"

    fill_in "Comments", with: @post_comment.comments
    fill_in "Post", with: @post_comment.post_id
    fill_in "User", with: @post_comment.user_id
    click_on "Create Comment"

    assert_text "Comment was successfully created"
    click_on "Back"
  end

  test "updating a Comment" do
    visit post_comments_url
    click_on "Edit", match: :first

    fill_in "Comments", with: @post_comment.comments
    fill_in "Post", with: @post_comment.post_id
    fill_in "User", with: @post_comment.user_id
    click_on "Update Comment"

    assert_text "Comment was successfully updated"
    click_on "Back"
  end

  test "destroying a Comment" do
    visit post_comments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Comment was successfully destroyed"
  end
end
