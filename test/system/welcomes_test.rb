require "application_system_test_case"

class WelcomesTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit root_path
    assert_text "Welcome to"
    assert_text "Binstagram"
  end
end
