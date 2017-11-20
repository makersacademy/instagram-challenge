require 'rails_helper'

feature 'Creating posts' do
  background do
    sign_in_as_valid_user
    visit '/'
    click_link 'New Post'
    fill_in 'text', with: 'Test photo post 1'
  end

  scenario 'can create a post' do
    attach_file('image', 'spec/files/images/test_img_1.jpg')
    click_button 'Create Post'
    expect(page).to have_content('Test photo post 1')
    expect(page).to have_css("img[src*='test_img_1.jpg']")
  end

  it 'needs an image to create a post' do
    click_button 'Create Post'
    expect(page).to have_content('Something is wrong with your form!')
  end
end
