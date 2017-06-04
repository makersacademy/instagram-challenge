require 'rails_helper'
require 'web_helpers'

RSpec.feature "Photos", type: :feature do
  scenario "user adds a photo", :type => :feature do
    add_photo
    page.should have_content("Deanna Troi")
    expect(page).to have_css("img[src*='deanna_troi.png']")
  end
end
