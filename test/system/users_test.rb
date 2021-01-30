require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test "Signing up as a new user" do
    visit root_path
    click_link "Sign-up"
    fill_in "username", with: "test_user"
    fill_in "email", with: "test@test.com"
    fill_in "password", with: "123"
    click_button "Create account"
    assert_text "You are signed in as: test_user"
  end
end
