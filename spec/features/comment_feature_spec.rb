require 'rails_helper'

feature 'Comments' do

  context 'Signing Up' do
    before do
      visit('/')
      click_link('Sign up')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button('Sign up')
      visit '/pictures'
      click_link 'Add a picture'
      attach_file('Image', "spec/fixtures/image.jpeg")
      fill_in 'Description', with: 'Test Upload'
      click_button 'Create Picture'
    end

  scenario 'Can add a comment to picture' do
      visit '/'
      click_link 'Test Upload'
      fill_in('comment', with: "This is just a test comment" )
      click_button('Leave Comment')
      expect(page).to have_content('This is just a test comment')
    end
  end
end
