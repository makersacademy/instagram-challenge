require 'rails_helper'

feature 'Index displays a list of posts' do

  scenario 'the index displays correct created job information' do
    visit '/'
    sign_up
    click_link 'New Post'
    attach_file('Image', 'spec/files/images/scenery.jpg')
    fill_in 'Caption', with: 'This is the first post.'
    click_button 'Create Post'
    click_link 'New Post'
    attach_file('Image', 'spec/files/images/scenery.jpg')
    fill_in 'Caption', with: 'This is the second post.'
    click_button 'Create Post'
    visit '/'

    expect(page).to have_content('This is the first post')
    expect(page).to have_content('This is the second post')
    expect(page).to have_css("img[src*='scenery']")
  end

  scenario 'the images in the index link to each individual show page' do
    visit '/'
    sign_up
    click_link 'New Post'
    attach_file('Image', 'spec/files/images/scenery.jpg')
    fill_in 'Caption', with: 'This is image number 1'
    click_button 'Create Post'
    visit '/'
    click_link 'This is image number 1'
    expect(page.current_path).to eq('/posts/1')
  end
end
