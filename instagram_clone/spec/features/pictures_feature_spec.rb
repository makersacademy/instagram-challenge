require 'rails_helper'

feature 'pictures' do
  context 'if none have been added yet' do
    scenario 'should display a prompt to add pictures' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet!'
      expect(page).to have_link 'Upload a picture'
    end
  end

  context 'uploading your first image' do
    scenario 'with a description' do
      sign_up
      click_link 'Upload a picture'
      attach_file 'Image', 'spec/features/McAvoy.jpg'
      fill_in 'Description', with: 'Bae'
      click_button 'Upload your picture'
      expect(page).to have_css("img[src*='McAvoy.jpg']")
      expect(page).to have_content 'Bae'
      expect(current_path).to eq '/pictures'
    end

    scenario 'does not let you upload without a description' do
      sign_up
      click_link 'Upload a picture'
      attach_file 'Image', 'spec/features/McAvoy.jpg'
      click_button 'Upload your picture'
      expect(page).to have_content 'error'
    end

    scenario 'user cannot upload a picture if not logged in' do
      visit '/'
      click_link 'Upload a picture'
      expect(current_path).to eq '/users/sign_in'
      expect(page).to have_content 'Log in'
    end
  end

  context 'deleting pictures' do
    before do
      sign_up
      click_link 'Upload a picture'
      attach_file 'Image', 'spec/features/McAvoy.jpg'
      fill_in 'Description', with: 'Bae'
      click_button 'Upload your picture'
    end

    scenario 'will remove photo when user clicks delete' do
      click_link 'Delete Bae'
      expect(page).not_to have_content 'Bae'
      expect(page).not_to have_css("img[src*='McAvoy.jpg']")
      expect(page).to have_content 'Picture deleted successfully'
      expect(current_path).to eq '/pictures'
    end
  end

  context 'editing pictures' do
    before do
      sign_up
      click_link 'Upload a picture'
      attach_file 'Image', 'spec/features/McAvoy.jpg'
      fill_in 'Description', with: 'Bae'
      click_button 'Upload your picture'
    end

    scenario 'allows user to edit an images description' do
      click_link 'Edit Bae'
      fill_in 'Description', with: 'My Bae'
      click_button 'Update your picture'
      expect(page).to have_content 'My Bae'
      expect(page).to have_css("img[src*='McAvoy.jpg']")
      expect(current_path).to eq '/pictures'
    end
  end

    def sign_up
      visit '/'
      click_link 'Sign Up'
      fill_in 'Email', with: 'test@email.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      click_button 'Sign up'
    end
end
