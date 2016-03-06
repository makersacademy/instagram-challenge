require 'rails_helper'
require_relative './helpers/photo_helpers'

feature 'comments' do
  before do
    sign_up_helper
    upload_photo
  end

  context 'a photo is uploaded' do
    scenario 'a user can add a comment to the photo' do
      leave_comment
      expect(page).to have_content('This is my comment')
    end

    scenario 'another user can comment on anothers photo' do
      sign_up_with_second_user
      leave_comment
      click_link('Sign out')
      expect(page).to have_content('This is my comment')
    end
  end

  context 'a photo with a comment' do
    before do
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

    scenario 'users can only delete their own comments' do
      sign_up_with_second_user
      visit photos_path
      expect(page).not_to have_link('Delete comment')
    end
  end

  context 'leaving a comment 1 hour ago' do
    scenario 'a comment contains the time ago and the username' do
      Timecop.travel(-3600)
      leave_comment
      Timecop.return
      visit photos_path
      expect(page).to have_content('Left by: test about 1 hour ago')
    end
  end
end
