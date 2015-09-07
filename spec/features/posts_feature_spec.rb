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
    before do
      Post.create(caption: '#life', picture_file_name: 'spec/asset_spec/images/testing.png')
    end

    scenario 'displays posts' do
      visit '/posts'
      expect(page).to have_content('#life')
      expect(page).not_to have_content('No posts have been added')
    end
  end

  context 'creating posts' do
    scenario 'prompts user to fill out a form, then displays the posts' do
      visit '/posts'
      click_link 'Add a post'
      fill_in 'Caption', with: '#life'
      attach_file 'post[picture]', 'spec/asset_spec/images/testing.png'
      click_button 'Upload'
      expect(page).to have_content('#life')
      expect(page).to have_selector(:css, "img[src*='testing.png']")
      expect(current_path).to eq('/posts')
    end
  end
end
