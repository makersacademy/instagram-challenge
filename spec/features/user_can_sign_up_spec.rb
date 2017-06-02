require 'rails_helper'

RSpec.feature "Sessions",  type: :feature do

  scenario "signs up the user", :type => :feature do
    sign_up
    page.should have_content("Welcome! You have signed up successfully.")
  end

  scenario "signs out the user", :type => :feature do
    sign_up
    click_on("Log Out")
    page.should have_content("Signed out successfully.")
  end

  scenario "signs in the user", :type => :feature do
    sign_up
    click_on("Log Out")
    log_in
    page.should have_content("Signed in successfully.")
  end
end
