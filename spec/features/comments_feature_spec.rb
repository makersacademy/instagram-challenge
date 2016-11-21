require 'rails_helper'

feature 'comments' do
  context 'posting a comment' do
    before do
      sign_up
      upload_a_photo
      click_link 'Comment'
      fill_in 'Body', with: 'Looking fit xx'
      click_button "Create Comment"
    end
    it 'allows users to post a comment' do
      expect(current_path).to eq '/photos'
      click_link 'View Comments'
      expect(page).to have_content 'Looking fit xx'
    end
    it 'allows users to post a reply to a comment' do
      sign_out
      sign_in_as_diff_user
      click_link 'View Comments'
      click_link 'Add reply'
      fill_in 'Body', with: 'Thanks babe xxx'
      click_button "Create Comment"
      click_link 'View Comments'
      expect(page).to have_content 'Thanks babe xxx'
    end
  end
  context 'deleting a comment' do
    before do
      sign_up
      upload_a_photo
      click_link 'Comment'
      fill_in 'Body', with: 'Looking fit xx'
      click_button "Create Comment"
    end
    it 'allows users to delete their own comments' do
      click_link 'View Comments'
      click_link 'Delete comment'
      click_link 'View Comments'
      expect(page).not_to have_content 'Looking fit xx'
    end
    it 'does not allows user to delete comments that are not their own' do
      sign_out
      sign_in_as_diff_user
      click_link 'View Comments'
      expect(page).not_to have_link 'Delete comment'
    end
  end
end
