require 'rails_helper'
require 'web_helpers'

RSpec.feature "Photos", type: :feature do
  scenario "user adds a photo", :type => :feature do
    sign_up
    add_photo
    expect(page).to have_content("Instagram Logo")
    expect(page).to have_css("img[src*='instagram-logo.jpg']")
  end

  scenario "user edits a photo", type: :feature do
    sign_up
    add_photo
    visit '/photos/1'
    click_button 'Edit'
    fill_in 'Title', with: 'Edited title'
    click_button "Add Photo"
    expect(page).to have_content("Edited title")
  end

  scenario "user deletes a photo", type: :feature do
    sign_up
    add_photo
    visit '/photos/1'
    click_button 'Edit'
    click_button 'Delete Photo'
    expect(page).not_to have_content('Instagram Logo')
  end
end
