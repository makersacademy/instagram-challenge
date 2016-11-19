require 'rails_helper.rb'

feature 'Creating posts' do
  scenario 'can create a post' do
    visit '/'
    click_link 'New Post'
    attach_file('Image', "spec/files/images/testimage.jpg")
    fill_in 'Caption', with: 'view from the hotel'
    click_button 'Create Post'
    expect(page).to have_content('view from the hotel')
    expect(page).to have_css("img[src*='testimage.jpg']")
  end
  it 'needs an image to create a post' do
  visit '/'
  click_link 'New Post'
  fill_in 'Caption', with: 'view from the hotel'
  click_button 'Create Post'
  expect(page).to have_content('Upload an image (this is required):')
  end
end
