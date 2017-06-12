require 'web_helpers'
require 'rails_helper'

RSpec.feature "Displaying the pictures ",  type: :feature do

  scenario "All pictures are displayed on the home page", :type => :feature do
  sign_up
  5.times { add_picture }
  visit("/")
  5.times { expect(page).to have_css("img[src*='sunset.jpg']")}
  end
end
