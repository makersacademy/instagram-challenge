require 'rails_helper'
require 'web_helpers'

RSpec.feature "Photos", type: :feature do
  scenario "user adds a photo", :type => :feature do
    add_photo
    expect(page).to have_content("Instagram Logo")
  end
end
