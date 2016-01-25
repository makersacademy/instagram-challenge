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
      sign_up(username: 'allimac',email: 'camilla@email.com', password: 'pass1234')
    end

    scenario 'a user can upload a photo' do
      visit '/'
      upload_photo
      expect(page).to have_css('img', 'city.jpg')
      expect(page).to have_content('by allimac')
      expect(current_path).to eq '/photos'
    end
  end

end

feature 'Viewing and deleting photoes' do

  context 'when no photos have been uploaded yet' do
    scenario 'no photos are shown' do
      visit '/'
      expect(page).to have_content 'OMG!'
      expect(page).not_to have_css('img')
    end
  end

  context 'when there are photos' do
    background do
      visit '/'
      sign_up(username: 'allimac',email: 'camilla@email.com', password: 'pass1234')
      upload_photo(path: 'spec/fixtures/city.jpg')
    end

    xit 'a user can see photos with the most recent at the top' do
      upload_photo(path: 'spec/fixtures/dog.jpg')
      visit '/'
      expect(page).to have_css(".row .col-md-12 img:eq(0)[src*='dog.jpg']")
      expect(page).to have_css(".row .col-md-12 img:eq(1)[src*='city.jpg']")
    end

    scenario 'a user is allowed to delete his photo' do
      visit '/'
      click_link 'Delete photo'
      expect(page).not_to have_css('img-rounded', 'city.jpg')
    end

    scenario 'another user is not allowed to delete his photo' do
      visit '/'
      click_link 'allimac'
      click_link 'Log out'
      sign_up(username: 'user2',email: 'user2@email.com', password: 'pass1234')
      expect(page).not_to have_content 'Delete photo'
    end
  end

end
