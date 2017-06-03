require 'rails_helper'
# require 'web_helpers'

RSpec.feature "Sessions",  type: :feature do

  scenario "signs up the user", :type => :feature do
    visit('/')
    click_on 'Sign Up'
    fill_in 'user_email', with: 'ana@test.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_on 'Sign up'
    page.should have_content("Welcome! You have signed up successfully.")
  end


#   scenario "signs in the user", :type => :feature do
#     sign_up
#     click_on("Log Out")
#     log_in
#     page.should have_content("Signed in successfully.")
#   end
#
#   scenario "signs out the user", :type => :feature do
#     sign_up
#     click_on("Log Out")
#     page.should have_content("Signed out successfully.")
#   end
end
