require 'web_helpers'
require 'rails_helper'

RSpec.feature "Creating new pictures ",  type: :feature do

  scenario "User can add a new photo", :type => :feature do
    sign_up
    add_picture
    expect(page).to have_css("img[src*='sunset.jpg']")
  end
end
