require 'rails_helper'
require 'feature_helper'

feature 'Creating comments' do

  context 'when signed in' do
    scenario 'can comment on a post from feed' do
      sign_up
      create_post("spec/files/images/castle.jpg", 'A lovely castle #wales')
      fill_in 'comment-body-on-post-1', with: "This is a comment on the lovely castle"
      click_button 'submit-comment-on-post-1'
      expect(page).to have_content "This is a comment on the lovely castle"
    end

    scenario 'can comment on a post from individual post' do
      sign_up
      create_post("spec/files/images/castle.jpg", 'A lovely castle #wales')
      click_on 'View post'
      fill_in 'comment-body-on-post-1', with: "This is a comment on the lovely castle"
      click_button 'submit-comment-on-post-1'
      expect(page).to have_content "This is a comment on the lovely castle"
    end
  end

  context 'when not signed in' do
    scenario 'cannot comment' do
      sign_up
      create_post("spec/files/images/castle.jpg", 'A lovely castle #wales')
      sign_out
      expect(page).not_to have_button 'Comment'
    end
  end

end