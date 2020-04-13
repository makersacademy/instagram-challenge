require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/accounts/sign_up"
    fill_in "First name", with: "John"
    fill_in "Last name", with: "Doe"
    fill_in "Username", with: "Testy"
    fill_in "Email", with: "test@test.com"
    fill_in "Password", with: "testtest"
    fill_in "Password confirmation", with: "testtest"
    click_button "Sign up"
    click_link "New Post"
    attach_file('Image', '/Users/sbell/Documents/Makers/chitter-challenge/public/images/peeper.png')
    fill_in 'Description', with: "this is a test image"
    click_button "Save Post"
    expect(page).to have_content("this is a test image")
  end
end
