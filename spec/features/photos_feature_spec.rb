require 'rails_helper'

feature 'photos' do
  context 'no photos have been added' do
    scenario 'should display a prompt to add a restaurant' do
      visit('/photos')
      expect(page).to have_content('No photos yet!')
      expect(page).to have_link('Upload a photo')
    end
  end

  context 'uploading photos' do
    scenario 'prompt user to fill out a form, then displays the photo' do
      visit('/photos')
      click_link('Upload a photo')
      fill_in('Description', with: 'Testing')
      attach_file('photo[image]', 'spec/support/fixtures/images/testing.png')
      click_button('Upload')
      expect(page).to have_content('Testing')
      expect(page).to have_selector(:css, "img[src*='testing.png']")
    end
  end

  context 'photos have been added' do
    before { create(:photo) }

    scenario 'display photos' do
      visit('/photos')
      expect(page).to have_content('Testing')
      expect(page).to have_selector(:css, "img[src*='testing.png']")
      expect(page).not_to have_content('No photos yet!')
    end
  end

  context 'viewing photos' do
    scenario 'let a user view a specific photo' do
      photo = create(:photo)
      visit('/photos')
      click_link('Testing')
      expect(page).to have_content('Testing')
      expect(page).to have_selector(:css, "img[src*='testing.png']")
      expect(current_path).to eq("/photos/#{photo.id}")
    end
  end
end
