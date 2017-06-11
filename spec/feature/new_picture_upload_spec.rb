require 'web_helpers'
require 'rails_helper'

RSpec.feature "Creating new pictures ",  type: :feature do

  scenario "User can add a new photo", :type => :feature do
    sign_up
    add_picture
    expect(page).to have_css("img[src*='sunset.jpg']")
  end

  scenario "User can edit a photo", :type => :feature do
    sign_up
    add_picture
    click_on("Edit")
    fill_in "Description", with: "Picture edited"
    click_on("Update Pic")
    expect(page).to have_content("Picture edited")
  end

  scenario "User can edit a photo", :type => :feature do
    sign_up
    add_picture
    click_on("Delete")
    expect(page).not_to have_content("sunset.jpg")
  end
end
