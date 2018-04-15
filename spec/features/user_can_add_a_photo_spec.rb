require 'rails_helper'

RSpec.feature "Adding photo", type: :feature do
  scenario "Can add a photo with a description" do
    visit "/posts"
    add_post
    expect(page).to have_content('Beautiful sunset')
    expect(page).to have_current_path("/posts")
  end
end
