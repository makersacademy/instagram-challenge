require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  test "adding a post" do
    visit root_path
    sign_up
    click_link "Post your bin"
    fill_in "Image url", with: "https://i.imgur.com/C5E1ya6.jpg"
    click_button "Post"
    assert_text "Latest Posts"
  end
end
