require 'rails_helper'

RSpec.feature "Adding photo", type: :feature do
  scenario "Can add a photo with a description" do
    sign_up
    add_post
    expect(page).not_to have_content("drayson.g@mac.com")
  end
end
