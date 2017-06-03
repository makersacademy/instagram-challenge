require 'rails_helper'
require 'web_helpers'


RSpec.feature "Sessions", type: :feature do
  scenario "signs up the user", :type => :feature do
    sign_up
    page.should have_content("Welcome to Instagram!")
  end

  scenario "user can sign in", :type => :feature do
    sign_up
    click_link('Log Out')
    log_in
    page.should have_content("Logged in as example@starfleet.com.")
  end

end
