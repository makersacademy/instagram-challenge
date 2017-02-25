require 'rails_helper'

feature 'Posts' do
  context 'User signed in, no Posts have been added' do
    before do
      sign_up
    end
    
    scenario 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Add a post'
    end
    
    scenario 'prompts user to fill out a form, then displays the new post' do
      create_post
      expect(page).to have_css("img[src*='google-test-framework.png']")
      expect(current_path).to eq "/posts"
    end
  end
end