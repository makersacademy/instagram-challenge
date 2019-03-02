require 'rails_helper'

RSpec.describe 'full journey' do
  scenario 'user can sign up, post, see his post, log out, log in, see his previous post' do
    visit '/'
    click_on("Sign up", match: :first)
    fill_in "user_email", with: 'test@email.com'
    fill_in "user_password", with: "asdasd"
    fill_in "user_password_confirmation", with: "asdasd"
    click_on("Submit")
    expect(page).to have_content("You have signed up successfully")
    click_on("New Post")
    fill_in "post_message", with: "test message"
    click_on "Submit"
    expect(page).to have_content("test message")
    click_on("Logout")
    expect(page).to have_content("You need to sign in or sign up before continuing")
    fill_in "user_email", with: 'test@email.com'
    fill_in "user_password", with: "asdasd"
    click_on("Log in")
    expect(page).to have_content('test message')
  end
end
