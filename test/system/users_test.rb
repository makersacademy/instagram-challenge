require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test "Signing up as a new user" do
    visit root_path
    sign_up
    assert_text "You are signed in as: test_user"
  end
end
