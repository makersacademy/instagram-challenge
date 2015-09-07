require 'rails_helper'

feature 'Posts' do
  context 'when no posts have been added' do
    scenario 'shows users link to add a post' do
      visit '/posts'
      expect(page).to have_content('No posts have been added')
      expect(page).to have_link('Add a post')
    end
  end

  context 'when posts have been created' do
    scenario 'displays posts' do
      create(:post)
      visit '/posts'
      expect(page).to have_content('#life')
      expect(page).not_to have_content('No posts have been added')
    end
  end

  context 'validations' do
    scenario 'raises error when user does not include image' do
      visit '/posts'
      click_link 'Add a post'
      fill_in 'Caption', with: 'Amazing!'
      click_button 'Upload'
      expect(page).to have_content("can't be blank")
    end
  end

  context 'creating posts' do
    scenario 'prompts user to fill out a form, then displays the posts' do
      visit '/posts'
      click_link 'Add a post'
      fill_in 'Caption', with: '#life'
      attach_file 'post[image]', 'spec/asset_spec/images/testing.png'
      click_button 'Upload'
      expect(page).to have_content('#life')
      expect(page).to have_css("img[src*='testing.png']")
      expect(current_path).to eq('/posts')
    end
  end

  context 'editing post captions' do
    scenario 'lets users edit captions' do
      create(:post)
      visit '/posts'
      click_link 'Edit Caption'
      fill_in 'Caption', with: 'This coffee is amazing!'
      click_button 'Update Post'
      expect(page).to have_content('This coffee is amazing!')
      expect(page).not_to have_content('#life')
    end
  end

  context 'deleting posts' do
    scenario 'allows users to delete their posts' do
      create(:post)
      visit '/posts'
      click_link 'Delete Post'
      expect(page).to have_content('Post deleted successfully')
      expect(page).not_to have_content('#life')
      expect(page).not_to have_css("img[src*='testing.png']")
    end
  end
end
