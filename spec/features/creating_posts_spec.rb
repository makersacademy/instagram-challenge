require 'rails_helper'

feature 'Creating posts' do
  scenario 'can create a post' do
    visit '/'
    click_link 'New Post'
    attach_file('image', 'spec/files/images/test_img_1.jpg')
    fill_in 'text', with: 'Test photo post 1'
    click_button 'Create Post'
    expect(page).to have_content('Test photo post 1')
    expect(page).to have_css("img[src*='test_img_1.jpg']")
  end
end