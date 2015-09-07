require 'rails_helper'

feature 'photos' do
  let(:user) { create(:user) }

  context 'no photos have been added' do
    scenario 'should display a prompt to add a photo' do
      visit('/photos')
      expect(page).to have_content('No photos yet!')
    end
  end

  context 'uploading photos' do
    scenario 'prompt user to fill out a form, then displays the photo' do
      sign_in_as(user)
      visit('/photos')
      click_link('Upload a photo')
      fill_in('Description', with: 'Testing')
      attach_file('photo[image]', 'spec/support/fixtures/images/testing.png')
      click_button('Upload')
      expect(page).to have_content('Testing')
      expect(page).to have_selector(:css, "img[src*='testing.png']")
    end

    scenario 'user is not allowed unless signed in' do
      visit('/')
      expect(page).not_to have_link('/Upload a photo')
      visit('/photos/new')
      expect(current_path).to eq('/users/sign_in')
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
    let!(:user) { create(:user) }
    let!(:photo) { create(:photo_without_user, user_id: user.id) }
    before { sign_in_as(user) }

    scenario 'let a user view a specific photo' do
      visit('/photos')
      click_link('Testing')
      expect(page).to have_content('Testing')
      expect(page).to have_selector(:css, "img[src*='testing.png']")
      expect(current_path).to eq("/photos/#{photo.id}")
    end
  end
end
