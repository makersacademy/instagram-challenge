require 'rails_helper'

feature 'New post' do
  scenario 'user can add a post' do
    visit '/'
    click_link 'New Post'
    attach_file('Image', "spec/images/tree.jpg")
    fill_in 'Caption', with: 'This is a tree' 
    click_button 'Create Post'
    expect(page).to have_content('This is a tree')
    expect(page).to have_css("img[src*='tree.jpg']")
  end

  scenario 'user cannot add a post without uploading an image' do 
    visit '/'
    click_link 'New Post'
    fill_in 'Caption', with: "This is a post without a picture"
    click_button 'Create Post'
    expect(page).to have_content('You must upload a picture!')
  end
end