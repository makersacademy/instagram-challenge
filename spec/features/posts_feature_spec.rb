require 'rails_helper'

feature 'Posts' do
  context 'User signed in, no Posts have been added' do
    before do
      sign_up
    end
    
    scenario 'should display a prompt to add a post' do
      visit '/'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Add a post'
    end
    
    scenario 'prompts user to fill out a form, then displays the new post' do
      create_post
      expect(page).to have_css("img[src*='google-test-framework.png']")
      expect(current_path).to eq "/posts"
    end
    
    context 'One post exists' do
      before do
        post = create(:post)
      end
      
      scenario 'user clicks like button and increments like counter' do
        visit '/'
        click_button 'Like'
        expect(page).to have_content "1 Like"
      end
    end
  end
end