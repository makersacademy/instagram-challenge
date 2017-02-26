require 'rails_helper'

feature 'Comments' do
  context 'User signed in, one post' do
    before do
      sign_up
      post = create(:post)
      visit '/'
    end
    
    scenario 'Post has an add comment link' do
      el = find('.posts')
      expect(el).to have_link "Comment"
    end
    
    scenario 'prompts user to fill out a form, then displays the new comment' do
      click_link 'Comment'
      fill_in "Content", with: "Nice pic"
      click_button 'Leave Comment'
      el = find('.posts')
      expect(el).to have_content "Nice pic"
    end
  end
end