require 'rails_helper'
require_relative './helpers/photo_helpers'

feature 'likes' do
  before do
    sign_up_helper
    upload_photo
  end
  context 'no likes' do
    scenario 'should display 0 likes ' do
      expect(page).to have_content '0 likes'
    end
  end

  context 'likes' do
    scenario 'shows the number of likes' do
      click_link 'Like'
      expect(page).to have_content '1 like'
    end

    scenario 'shows the users that like the photos' do
      click_link 'Like'
      sign_up_with_second_user
      click_link 'Like'
      expect(page).to have_content '2 likes: test, test2'
    end

    scenario 'a user can only like a photo once' do
      click_link 'Like'
      expect(page).not_to have_link('Like')
    end
  end
end
