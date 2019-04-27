require 'rails_helper'
require 'create_user_and_sign_up'

RSpec.feature "Sign in", type: :feature do
  scenario "User can click link through to sign in page" do
    visit "/"
    expect(page).to have_link("Sign in")
  end

  scenario "User prompted to enter their email address and password to login" do
    visit "/"
    click_link("Sign in")
    expect(page).to have_field("user_email")
    expect(page).to have_field("user_password")
  end
end
