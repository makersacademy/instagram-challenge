require 'rails_helper'

describe 'Comment' do

  context 'new comment' do

    let!(:user_post) {Post.create(name: 'at the beach')}

    scenario 'user can add a comment to a post' do
      visit '/posts'
      click_link 'at the beach'
      click_link 'Add Comment'
      fill_in "Comment", with: 'nice day for a swim'
      click_button "Add Comment"
      expect(page).to have_content 'nice day for a swim'
    end

  end

end