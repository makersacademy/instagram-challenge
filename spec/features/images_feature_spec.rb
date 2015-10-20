require 'rails_helper'

feature 'images' do
  before(:each) do
    @user = create(:user)
    sign_in(@user)
    create_image
  end

  context 'no images have been added yet' do
    scenario 'It should have a prompt to add an image' do
      visit '/images'
      expect(page).to have_link 'Add an Image'
    end
  end
  context 'images have been added' do
    scenario 'images are displayed' do
      visit '/images'
      expect(page).to have_content('Breakfast')
      expect(page).not_to have_content('No Images Added yet')
    end
  end
  context 'Create an Image' do
    scenario 'prompts a user to fill out a form to add an image' do
      visit '/images'
      click_link 'Add an Image'
      fill_in 'Name', with: 'postcard'
      click_button 'Create Image'
      expect(page).to have_content('postcard')
      expect(current_path).to eq('/images')
    end
  end
  context 'when not signed in' do
    scenario 'does not let you create a Image' do
      click_link 'Sign out'
      expect(page).to_not have_link('Add an Image')
    end
  end

  context 'Viewing an Image' do
    scenario 'lets a user view an image' do
      visit '/images'
      click_link 'Breakfast'
      expect(page).to have_content('Breakfast')
      expect(page).to have_selector('img')
    end
  end
  context 'Editing an Image' do
    scenario 'let a user edit an image' do
      visit '/images'
      click_link 'Edit breakfast'
      fill_in 'Name', with: 'My Breakfast'
      click_button 'Update Image'
      expect(page).to have_content('My Breakfast')
      expect(current_path).to eq('/images')
    end
    scenario 'cannot edit an image unless signed in' do
      click_link('Sign out')
      visit('/images')
      expect(page).not_to have_link('Edit breakfast')
    end
    scenario 'can only edit if user who created' do
      click_link('Sign out')
      @wrong_user = create(:user, email: "wrong@test.com")
      sign_in(@wrong_user)
      visit('/images')
      expect(page).not_to have_link("Edit breakfast")
    end
  end
  context 'Can delete an Image' do
    scenario 'let a user delete an image' do
      visit '/images'
      click_link 'Delete breakfast'
      expect(page).not_to have_content('breakfast')
      expect(page).to have_content('Image deleted successfully')
    end
    scenario 'A user cannot delete an image they did not create' do
      click_link('Sign out')
      expect(page).not_to have_link('Delete breakfast')
    end
    scenario 'can only delete if user who created' do
      click_link('Sign out')
      @wrong_user = create(:user, email: "wrong@test.com")
      sign_in(@wrong_user)
      visit('/images')
      expect(page).not_to have_link("Delete breakfast")
    end
  end
end
