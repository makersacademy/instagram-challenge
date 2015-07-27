require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Add a picture'
    end
  end

  context 'uploading pictures' do
    before do
      user = User.create email: 'kirsten@jones.com', password: 'kjkjkjkj', password_confirmation: 'kjkjkjkj'
      login_as user
    end

    scenario 'a user who is signed in should be able to add a picture' do
      visit '/pictures'
      click_link 'Add a picture'
      expect(current_path).to eq '/pictures/new'
      fill_in('Caption', with: 'Test caption')
      attach_file 'Image', './spec/capybara.jpeg'
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

  context 'viewing pictures' do

    before do
      user = User.create email: 'kirsten@jones.com', password: 'kjkjkjkj', password_confirmation: 'kjkjkjkj'
      login_as user
    end

    scenario 'pictures are displayed with the email address of the user who uploaded them' do
      visit '/pictures'
      click_link 'Add a picture'
      fill_in('Caption', with: 'Test caption')
      attach_file 'Image', './spec/capybara.jpeg'
      click_button 'Create Picture'
      expect(page).to have_content 'kirsten@jones.com'
    end

  end
end
