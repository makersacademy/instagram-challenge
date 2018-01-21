require 'rails_helper'
require 'feature_helpers'

feature 'users' do
  scenario 'users can sign up' do
    sign_up
    expect(page).to have_content 'Welcome Tester'
  end
end

feature 'create image posts' do
  scenario 'signed in users can add image posts' do
    sign_up
    visit '/posts/new'
  # save_and_open_page
     attach_file('Image', "spec/test_files/angery.jpg")
    fill_in 'Caption', with: 'MY CAPTIONNN!!!'
    click_on 'Submit post'
    expect(page).to have_content 'MY CAPTIONNN!!!'
    expect(page).to have_css "img[src*='angery.jpg']"
  end
end
