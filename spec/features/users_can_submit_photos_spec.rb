require 'rails_helper'

RSpec.feature "Photo Posting", type: :feature do
  scenario "User can see a button to upload a new photo" do
    new_user
    visit "/posts"
    expect(page).to have_link("Upload")
  end

  scenario 'User is taken to image upload page' do
    new_user
    click_link 'Upload'
    expect(page).to have_field("post_text")
  end

  scenario 'User cannot upload without account' do
    new_logged_out_user
    click_link 'Upload'
    expect(page).not_to have_field("post_text")
    expect(page).to have_content("Sorry, you need to be logged in to make a new post")
  end

  scenario 'User can upload, describe, post and then see image' do
    new_user
    click_link 'Upload'
    fill_in 'post_text', with: 'v i b e s'
    attach_file("post_photo", Rails.root + "vaporwave.gif")
    click_button 'Submit'
    expect(page).to have_xpath("//img[contains(@src,'vaporwave.gif')]")
  end
end
