require 'rails_helper'

feature 'comments' do
  context 'posting a comment' do
    scenario 'posting a comment' do
      upload_a_photo
      click_link 'Leave a comment'
      fill_in 'comment', with: 'Looking fit xx'
      click_button "Comment"
      expect(current_path).to eq '/photos'
      expect(page).to have_content 'Looking fit xx'
    end
  end
end
