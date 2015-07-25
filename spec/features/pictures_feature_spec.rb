require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Add a picture'
    end
  end

  context 'uploading images' do
    before do
      user = User.create email: 'kirsten@jones.com', password: 'kjkjkjkj', password_confirmation: 'kjkjkjkj'
      login_as user
    end

    scenario 'a user adds a picture when signed in' do
      visit '/pictures'
      click_link 'Add a picture'
      expect(current_path).to eq '/pictures/new'
      fill_in('Caption', with: 'Test caption')
      attach_file 'Image', '/users/kirstenjones/projects/instagram-challenge/spec/capybara.jpeg'
      click_button 'Create Picture'
      expect(page).to have_content 'Test caption'
      expect(page).not_to have_content 'No pictures yet'
    end

    scenario 'a user who is not signed in should not be able to add a picture' do
      visit '/pictures'
      click_link 'Sign out'
      click_link 'Add a picture'
      expect(current_path).not_to eq '/pictures/new'
    end
  end
end
