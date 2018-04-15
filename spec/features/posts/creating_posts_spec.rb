require 'rails_helper'

feature 'Creating posts' do
  background do
  user = create :user
  sign_in_with user
end

  scenario 'can create a post' do
    visit '/'
    click_link 'New Post'
    attach_file('Image', 'spec/fixtures/images/Brainslug.jpg')
    fill_in 'Caption', with: 'Me when I try to understand routes'
    click_button 'Create Post'
    expect(page).to have_content('Me when I try to understand routes')
    expect(page).to have_css("img[src*='Brainslug']")
  end

  it 'requires an image to create a post' do
    visit '/'
    click_link 'New Post'
    fill_in 'Caption', with: 'Too shy to share a pic'
    click_button 'Create Post'
    expect(page).to have_content("Where's your beautiful picture?")
  end
end
