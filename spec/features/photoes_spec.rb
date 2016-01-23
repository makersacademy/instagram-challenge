require 'rails_helper'

feature 'Uploading photoes' do

  scenario 'a not logged in user can\'t upload a photo' do
    visit '/'
    click_link 'Upload'
    expect(current_path).to eq '/users/sign_in'
  end

  context 'when logged in' do
    background do
      visit '/'
      sign_up(email: 'camilla@email.com', password: 'pass1234')
    end

    scenario 'a user can upload a photo to his account' do
      visit '/'
      upload_photo
      expect(page).to have_css('img', 'city.jpg')
      expect(current_path).to eq '/photos'
    end
  end

end

feature 'Viewing and deleting photoes' do

  context 'when no photos have been uploaded yet' do
    it 'if there are no photos' do
      visit '/'
      expect(page).to have_content 'No photos yet!'
      expect(page).not_to have_css('img')
    end
  end

  context 'when there are photos' do
    background do
      visit '/'
      sign_up(email: 'camilla@email.com', password: 'pass1234')
      upload_photo
    end

    it 'shows photos on the home page' do
      visit '/'
      expect(page).to have_css('img', 'city.jpg')
    end

    it 'allows the owner to delete one of his photo' do
      visit '/'
      click_link 'delete photo'
      expect(page).not_to have_css('img', 'city.jpg')
    end

  end

end
