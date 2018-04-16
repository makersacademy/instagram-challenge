require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/users/sign_up"
    fill_in "user_email", with: "test@test.com"
    fill_in "user_password", with: "test123"
    fill_in "user_password_confirmation", with: "test123"
    click_button "Sign up"

    visit "/posts"
    click_link "New Post"
    fill_in "post_description", with: "Hello, world!"
    click_button "Create post"
    expect(page).to have_content("Hello, world!")
  end
end
