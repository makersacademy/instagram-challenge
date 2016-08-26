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

end
