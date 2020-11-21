require 'rails_helper'
require 'web_helpers'
RSpec.feature "Upload images", type: :feature do
  scenario "Can upload images" do
    add_new_user
    expect(page).to have_content("test@testing.com")
    click_on('New post')
    fill_in('caption', with: "Test post")
    attach_file("image", Rails.root + "spec/fixtures/gunnersaurus.jpg")
    click_on('Submit')
    expect(page).to have_content("Your image was uploaded successfully!")
  end
end