require 'rails_helper.rb'

feature 'Creating posts' do
  scenario 'can create a post' do
    visit '/'
    click_link 'New Post'
    attach_file('Image', "spec/files/images/petticoatlane.jpg")
    fill_in 'Caption', with: 'petticoat lane #london'
    click_button 'Create Post'
    expect(page).to have_content('#london')
    expect(page).to have_css("img[src*='petticoatlane.jpg']")
  end

  it 'needs an image to create a post' do
    visit '/'
    click_link 'New Post'
    fill_in 'Caption', with: 'no pictures here'
    click_button 'Create Post'
    expect(page).to have_content('You must upload an image to be able to post')
  end
end
