require 'rails_helper'
require 'web_helpers'


RSpec.feature "Sessions", type: :feature do
  scenario "user can sign up via sign_up page", :type => :feature do
    sign_up
    page.should have_content("Welcome to Instagram!")
  end

  scenario "user can sign up via sign_in page", :type => :feature do
    visit '/users/sign_in'
    click_button 'Sign Up'
    sign_up
    page.should have_content("Welcome to Instagram!")
  end

  scenario "user can sign in", :type => :feature do
    sign_up
    click_link('Log Out')
    log_in
    page.should have_content("Welcome, Deanna.")
  end

  scenario "user can sign out", :type => :feature do
    sign_out
    page.should have_content("You need to sign in or sign up before continuing.")
  end

end
