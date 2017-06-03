require 'rails_helper'
require 'web_helpers'


RSpec.feature "Sessions", type: :feature do
  scenario "signs up the user", :type => :feature do
    sign_up
    page.should have_content("Welcome to Instagram!")
  end


end
