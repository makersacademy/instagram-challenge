require 'rails_helper'

feature 'liking pictures' do

  before do
    visit '/'
    click_link('Sign up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
    click_link 'Add a picture'
    fill_in 'Caption', with: 'Picture'
    page.attach_file('picture_image', Rails.root + 'IMG_4016.jpg')
    click_button 'Create Picture'
  end

  scenario 'a user can like a picture, which updates the picture like count', js: true do
    visit '/pictures'
    click_link '🙌'
    expect(page).to have_content('1 likes')
  end

end
