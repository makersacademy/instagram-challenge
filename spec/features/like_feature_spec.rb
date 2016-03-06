require 'rails_helper'
require_relative './helpers/photo_helpers'

feature 'likes' do
  context 'no likes' do
    scenario 'should display 0 likes ' do
      sign_up_helper
      upload_photo
      expect(page).to have_content '0 likes'
    end
  end

  context 'likes' do
    scenario 'shows the number of likes' do
      sign_up_helper
      upload_photo
      click_link 'Like'
      expect(page).to have_content '1 like'
    end
  end
end
