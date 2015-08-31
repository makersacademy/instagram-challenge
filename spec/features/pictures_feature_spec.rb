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
      user = create(:user)
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
      user = create(:user)
      login_as user
    end

    scenario 'pictures are displayed with the username of the user who uploaded them' do
      visit '/pictures'
      click_link 'Add a picture'
      fill_in('Caption', with: 'Test caption')
      attach_file 'Image', './spec/capybara.jpeg'
      click_button 'Create Picture'
      expect(page).to have_content 'katsuraku'
      expect(page).to have_css("img[src*='capybara']")
    end
  end

  context 'deleting pictures' do

    before do
      user = create(:user)
      @user2 = User.create email: 'katsuraku@gmail.com', password: 'kjkjkjkj', password_confirmation: 'kjkjkjkj', username: 'kjones'
      login_as user

      visit '/pictures'
      click_link 'Add a picture'
      fill_in('Caption', with: 'Test caption')
      attach_file 'Image', './spec/capybara.jpeg'
      click_button 'Create Picture'
    end

    scenario 'let a user delete a picture which they added' do
      click_link 'Delete'
      expect(page).not_to have_content 'Test caption'
    end

    scenario 'do not let a user who delete a picture added by another user' do
      click_link 'Sign out'
      login_as @user2
      click_link 'Delete'
      expect(page).to have_content 'Test caption'
      expect(page).to have_content 'You cannot delete this picture'
    end
  end
end
