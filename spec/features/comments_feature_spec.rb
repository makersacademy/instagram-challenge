require 'rails_helper'

feature 'comments' do
  context 'posting a comment' do
    scenario 'posting a comment' do
      sign_up
      upload_a_photo
      click_link 'Comment'
      fill_in 'Body', with: 'Looking fit xx'
      click_button "Create Comment"
      expect(current_path).to eq '/photos'
      click_link 'View Comments'
      expect(page).to have_content 'Looking fit xx'
    end
  end
end
