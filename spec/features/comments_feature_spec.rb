require 'rails_helper'
require_relative './helpers/photo_helpers'

feature 'comments' do
  context 'a photo is uploaded' do
    before{upload_photo}

    scenario 'a user can add a comment to the photo' do
      click_link 'Add comment'
      fill_in 'Comment', with: 'This is my comment'
      click_button 'Leave Comment'
      expect(page).to have_content('This is my comment')
    end
  end
end
