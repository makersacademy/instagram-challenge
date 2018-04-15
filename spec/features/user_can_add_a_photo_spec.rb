require 'rails_helper'

RSpec.feature "Adding photo", type: :feature do
  scenario "Can add a photo with a description" do
    sign_up
    add_post
    expect(page).to have_content('Beautiful sunset')
    expect(page).to have_css("img[src*='https://cdn.acidcow.com/pics/20131010/instagram_16.jpg']")
    expect(page).to have_current_path("/posts")
  end
end
