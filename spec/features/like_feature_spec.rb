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
      first('.like_link').click
      expect(page).to have_content '1 like'
    end

    scenario 'shows the users that like the photos' do
      first('.like_link').click
      sign_up_with_second_user
      first('.like_link').click
      expect(page).to have_content '2 likes: test, test2'
    end

    scenario 'a user can only like a photo once' do
      first('.like_link').click
      expect(page).not_to have_link('♡')
    end
  end
end
