require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  test "adding a post" do
    visit root_path
    sign_up
    click_link "Post your bin"
    assert_text "Create post:"
  end
end
