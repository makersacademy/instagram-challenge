require "application_system_test_case"

class InstaPostsTest < ApplicationSystemTestCase
  setup do
    @insta_post = insta_posts(:one)
  end

  test "visiting the index" do
    visit insta_posts_url
    assert_selector "h1", text: "Insta Posts"
  end

  test "creating a Insta post" do
    visit insta_posts_url
    click_on "New Insta Post"

    fill_in "Description", with: @insta_post.description
    fill_in "Name", with: @insta_post.name
    fill_in "Picture", with: @insta_post.picture
    click_on "Create Insta post"

    assert_text "Insta post was successfully created"
    click_on "Back"
  end

  test "updating a Insta post" do
    visit insta_posts_url
    click_on "Edit", match: :first

    fill_in "Description", with: @insta_post.description
    fill_in "Name", with: @insta_post.name
    fill_in "Picture", with: @insta_post.picture
    click_on "Update Insta post"

    assert_text "Insta post was successfully updated"
    click_on "Back"
  end

  test "destroying a Insta post" do
    visit insta_posts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Insta post was successfully destroyed"
  end
end
