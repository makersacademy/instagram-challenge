require 'rails_helper'

RSpec.feature 'Users can', type: :feature do

  scenario 'access sign-up page' do
    visit "/"
    expect(page).to have_link("Sign up")
    expect(page).to have_link("Sign in")
    # expect(page).to have_field("user[email]")
    # expect(page).to have_content("Password")
    # expect(page).to have_field("user[password]")
    # expect(page).to have_content("Password confirmation")
    # expect(page).to have_field("user[password_confirmation]")
    # expect(page).to have_button("Sign up")
    # expect(page).to have_selector(:css, 'a[href="/users/sign_in"]')
  end

end
