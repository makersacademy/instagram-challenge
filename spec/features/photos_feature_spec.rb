require 'rails_helper'

feature 'Photos' do

  context 'Posting a new photo' do

    scenario 'must be signed in to post a new photo' do
      visit '/photos/new'
      expect(current_path).to eq '/users/sign_in'
    end

    scenario 'user can select a photo to upload' do
      sign_up
      click_link 'Add a new photo'
      expect(page).to have_field 'Photo url'
      expect(page).to have_field 'Description'
    end

    scenario 'user can post a new photo' do
      sign_up
      create_photo(photo_url: 'something.png', description: 'helooo')
      expect(page).to have_content 'helooo'
      expect(page).to have_xpath("//img[contains(@src, 'something.png')]")
    end

  end

  context 'Viewing an individual photo' do

    let!(:photo) { Photo.create(photo_url: 'something.png', description: 'Something nice') }
    scenario 'can view an individual photo' do
      visit '/'
      find("//a[@id='#{photo.id}']").click
      expect(current_path).to eq "/photos/#{photo.id}"
      expect(page).to have_content 'Something nice'
      expect(page).to have_xpath("//img[contains(@src, 'something.png')]")
    end

    scenario 'does not let you view a photo that does not exist' do
      visit "/photos/#{photo.id + 1}"
      expect(current_path).to eq '/'
    end

  end

end
