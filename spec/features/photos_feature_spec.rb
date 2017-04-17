require 'rails_helper'

feature 'photos' do
  let(:user) { create(:user) }

  context 'no photos have been added' do
    scenario 'should display a prompt to add a photo' do
      visit('/photos')
      expect(page).to have_content('No photos yet!')
    end
  end

  context 'upload photos' do
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

    scenario 'user is not allowed to unless signed in' do
      visit('/photos')
      expect(page).not_to have_link('/Upload a photo')
      visit('/photos/new')
      expect(current_path).to eq('/users/sign_in')
    end
  end

  context 'photos have been added' do
    let!(:photo) { create(:photo, user: user) }

    scenario 'display photos' do
      visit('/photos')
      expect(page).to have_content('Testing')
      expect(page).to have_selector(:css, "img[src*='testing.png']")
      expect(page).not_to have_content('No photos yet!')
    end

    scenario 'shows the photo uploader and time since' do
      sign_in_as(user)
      click_link('Testing')
      expect(page).to have_content('Testing')
      expect(page).to have_selector(:css, "img[src*='testing.png']")
      expect(page).to have_content('Uploaded by user')
      expect(page).to have_content('0 hours ago')
    end
  end

  context 'viewing photos' do
    let(:user) { build(:user) }
    let!(:photo) { create(:photo, user: user) }
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
