require 'rails_helper'
require 'web_helpers'

RSpec.feature "Index", type: :feature do


  scenario "users can see all photos on the home page", type: :feature do
    sign_up
    5.times { add_photo }
    visit "/"
    5.times { expect(page).to have_css("img[src*='instagram-logo.jpg']")}
  end
end
