require 'rails_helper'

feature 'photos' do

  context 'have not been added' do

    scenario 'should display a prompt to add an image' do
      visit '/'
      expect(page).not_to have_link "New Photo"
      sign_up_user1
      visit '/photos'
      expect(page).to have_content 'No photos yet'
      expect(page).to have_link 'New Photo'
    end
  end

  context 'have been added' do

    before do
      sign_up_user1
      upload_photo
    end

    scenario 'displays photos and captions' do
      visit '/photos'
      expect(page).to have_content "Night sky"
      expect(page).not_to have_content "No photos yet"
      expect(page).to have_css("img[src*='night_sky']")
    end

    scenario 'views a photo' do
      visit '/photos'
      find("img[src*='night_sky']").click
      expect(page).to have_content 'Night sky'
      expect(page).to have_css("img[src*='night_sky']")
    end

    scenario 'user cannot edit other users photos' do
      click_link 'Sign out'
      sign_up_user2
      visit '/photos'
      find("img[src*='night_sky']").click
      expect(page).not_to have_link 'Edit'
    end

    scenario 'user can edit their own photos' do
      visit '/photos'
      all('a.photo').first.click
      click_link 'Edit'
      fill_in 'Caption', with: 'Blue sky'
      click_button 'Update Photo'
      expect(page).to have_content 'Blue sky'
    end

    scenario 'user cannot delete other users photos' do
      click_link 'Sign out'
      sign_up_user2
      visit '/photos'
      find("img[src*='night_sky']").click
      expect(page).not_to have_link 'Delete'
    end

    scenario 'user can delete their own photos' do
      visit '/photos'
      all('a.photo').first.click
      expect{ click_link 'Delete' }.to change{Photo.all.size}.by(-1)
    end
  end
end