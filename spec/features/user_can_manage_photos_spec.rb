require 'rails_helper'
require 'web_helpers'

RSpec.feature "Photos", type: :feature do
  scenario "user adds a photo", :type => :feature do
    add_photo
    expect(page).to have_content("Instagram Logo")
  end

  scenario "user edits a photo", type: :feature do
    add_photo
    visit '/photos'
    click_button 'Edit'
    click_button 'Edit'
    fill_in 'Title', with: 'Edited title'
    click_button "Create Photo"
    expect(page).to have_content("Edited title")
  end

  scenario "user deletes a photo", type: :feature do
    add_photo
    visit '/photos'
    click_button 'Edit'
    click_button 'Delete Photo'
    expect(page).not_to have_content('Instagram Logo')
  end
end
