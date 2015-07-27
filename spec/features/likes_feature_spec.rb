require 'rails_helper'

feature 'liking pictures' do

  # scenario 'The picture has 0 likes by default' do
  #   expect(page).to have_content '0 likes'
  # end

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
