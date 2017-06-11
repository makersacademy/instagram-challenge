require 'web_helpers'
require 'rails_helper'

RSpec.feature "Sessions",  type: :feature do

  scenario "signs up the user", :type => :feature do
    sign_up
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end

  scenario "user can sign in", :type => :feature do
    sign_in
    expect(page).to have_content("Signed in successfully.")
  end

  scenario "user can sign out", :type => :feature do
    sign_out
    expect(page).to have_content("Signed out successfully.")
  end
end

# expect(page).to have_selector("img[src=#{path}]")
