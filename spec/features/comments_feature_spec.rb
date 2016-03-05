require 'rails_helper'
require_relative './helpers/photo_helpers'

feature 'comments' do
  context 'a photo is uploaded' do
    scenario 'a user can add a comment to the photo' do
      sign_up_helper
      upload_photo
      leave_comment
      expect(page).to have_content('This is my comment')
    end
  end

  context 'a photo with a comment' do
    before do
      sign_up_helper
      upload_photo
      leave_comment
    end

    scenario 'a user can delete a comment' do
      click_link 'Delete comment'
      expect(page).not_to have_content('This is my comment')
    end

    scenario 'deleting a photo, deletes the comment as well' do
      click_link 'Delete photo'
      expect(page).not_to have_content('This is my comment')
    end

  end
end
