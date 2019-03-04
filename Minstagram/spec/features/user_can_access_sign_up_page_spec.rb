require 'rails_helper'

RSpec.feature 'sign-up page', type: :feature do

  scenario 'user can access sign-up page' do
    visit "/users/sign_up"
    expect(page).to have_content("Sign up")
    expect(page).to have_content("User name")
    expect(page).to have_field("user[user_name]")
    expect(page).to have_content("Email")
    expect(page).to have_field("user[email]")
    expect(page).to have_content("Password")
    expect(page).to have_field("user[password]")
    expect(page).to have_content("Password confirmation")
    expect(page).to have_field("user[password_confirmation]")
    expect(page).to have_button("Sign up")
    expect(page).to have_selector(:css, 'a[href="/users/sign_in"]')
  end

end
