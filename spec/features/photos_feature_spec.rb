require 'rails_helper'

feature 'photos' do
  context 'no photos have been added' do
    scenario 'should display message "no photos on your feed"' do
      visit photos_path
      expect(page).to have_content 'no photos on your feed'
      expect(page).to have_link 'Add a photo'
    end
  end

  context 'photos can be added and displayed' do

    before do
      user = build(:user)
      sign_up(user)
    end

    scenario 'add and display photos' do
      visit photos_path
      click_link 'Add a photo'
      fill_in 'Caption', with: 'lazy cat'
      attach_file "photo[image]", 'spec/assets_spec/images/cat.png'
      click_button "Create Photo"
      expect(page).to have_content 'lazy cat'
      expect(page).not_to have_content 'no photos on your feed'
      expect(page).to have_selector("img")
    end

    scenario 'cannot add a photo without an image' do
      visit photos_path
      click_link 'Add a photo'
      fill_in 'Caption', with: 'lazy cat'
      click_button "Create Photo"
      expect(page).to have_content 'photo cannot be blank'
    end

    scenario 'cannot add a photo without a caption' do
      visit photos_path
      click_link 'Add a photo'
      attach_file "photo[image]", 'spec/assets_spec/images/cat.png'
      click_button "Create Photo"
      expect(page).to have_content 'Caption can\'t be blank'
    end
  end

  context 'deleting photos' do
    before do
      user = build(:user)
      sign_up(user)
      click_link 'Add a photo'
      fill_in 'Caption', with: 'lazy cat'
      attach_file "photo[image]", 'spec/assets_spec/images/cat.png'
      click_button "Create Photo"
    end

    scenario 'user can delete own photo' do
      click_link 'Delete photo'
      expect(page).to have_content 'Photo deleted successfully'
      expect(page).to have_content 'no photos on your feed'
    end

    scenario 'user cannot delete photos that belong to other users' do
      click_link 'Sign out'
      user2 = build(:user2)
      sign_up(user2)
      click_link 'Delete photo'
      expect(page).to have_content 'lazy cat'
      expect(page).not_to have_content 'no photos on your feed'
      expect(page).to have_selector("img")
    end
  end

end


