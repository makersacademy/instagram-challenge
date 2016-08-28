require 'rails_helper'

feature 'Creating posts' do
  scenario 'user can create a post' do
    visit '/'
    click_link 'New Post'
    attach_file('Image', 'spec/files/images/cat.jpg')
    fill_in 'Caption', with: "My cat"
    click_button 'Submit'
    expect(page).to have_content "My cat"
    expect(page).to have_css("img[src*='cat.jpg']")
  end
end
