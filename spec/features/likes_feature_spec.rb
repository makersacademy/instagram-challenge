require 'rails_helper'

feature 'liking pictures' do
  scenario 'The picture has 0 likes by default' do
    visit '/pictures'
    sign_up
    upload_picture
    expect(page).to have_content '0 likes'
  end

  scenario 'a user can like a picture, which increases the like count by one', js:true do
    sign_up
    upload_picture
    visit '/pictures'
    click_button('like')
    expect(page).to have_content('1 like')
  end


  def sign_up
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
  end

  def upload_picture
    visit '/pictures'
    click_link 'Click here to add a picture!'
    fill_in 'Title', with: 'PFC'
    attach_file "Image", 'spec/features/Pompey.jpg'
    click_button 'Upload picture'
  end

end
