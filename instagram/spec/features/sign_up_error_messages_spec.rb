require 'rails_helper'
require_relative 'web_help_errors_signup'

RSpec.describe "Erro Messages during sign up", type: :feature do
  scenario "user see error message for name signup error" do
    visit("/signup")
    fill_in_details_with_out_name
    click_button('Next')
    expect(page).to have_content("Name can't be blank")
  end

  scenario "user see error message for username signup error" do
    visit("/signup")
    fill_in_details_with_out_username
    click_button('Next')
    expect(page).to have_content("Username can't be blank")
  end

  scenario "user see error message for password signup error" do
    visit("/signup")
    fill_in_details_with_out_password
    click_button('Next')
    expect(page).to have_content("Password can't be blank")
  end


  scenario "user see error message for short password signup error" do
    visit("/signup")
    fill_in_details_with_short_password
    click_button('Next')
    expect(page).to have_content("Password is too short (minimum is 4 characters)")
  end

  scenario "user see error message for email signup error" do
    visit("/signup")
    fill_in_details_with_long_password
    click_button('Next')
    expect(page).to have_content("Password is too long (maximum is 10 characters)")
  end
end