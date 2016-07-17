require 'rails_helper'
require 'web_helper'

feature 'Posts' do
  context 'new post' do
    scenario 'should display a prompt to add a photo and caption' do
      create_post
      expect(page).to have_content 'Snowboarding in Canada #winter'
      expect(page).to have_css "img[src*='canada.jpg']"
      expect(current_path).to eq '/posts'
    end
  end

  context 'editing posts' do
    scenario 'user can edit image caption' do
      create_post
      click_link 'Edit Post'
      fill_in 'Caption', with: 'Snowboarding in Canada #winter #mountains'
      click_button 'Update Post'
      expect(page).to have_content 'Snowboarding in Canada #winter #mountains'
      expect(current_path).to eq '/posts'
    end
  end

  context 'deleting posts' do
    scenario 'user can delete a post' do
      create_post
      click_link 'Delete Post'
      expect(page).not_to have_content 'Snowboarding in Canada #winter'
      expect(page).to have_content 'Post deleted successfully'
    end
  end
end
