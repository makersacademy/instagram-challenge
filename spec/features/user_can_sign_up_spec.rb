require 'rails_helper'
require 'web_helpers'

RSpec.feature "Sessions", :type => :feature do
  scenario "a user signs up", :type => :feature do
    sign_up
    page.should have_content("Welcome! You have signed up successfully")
  end
end
