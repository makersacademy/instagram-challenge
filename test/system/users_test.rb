require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test "Signing up as a new user" do
    visit root_path
    click_link "Sign-up"
    fill_in "user[username]", with: "test_user"
    fill_in "user[email]", with: "test@test.com"
    fill_in "user[password]", with: "123"
    click_button "Create account"
    assert_text "You are signed in as: test_user"
  end
end
