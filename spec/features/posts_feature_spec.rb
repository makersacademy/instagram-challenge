require 'rails_helper'

feature 'posts' do
  context 'if no photos have been posted' do
    scenario 'display a message that there are no posts' do
      visit '/posts'
      expect(page).to have_content 'No posts yet...'
    end
  end

  context 'if photos have been posted' do
    before do
      Post.create(description: 'Sample post', image_file_name: 'sample.jpg')
    end

    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_content 'Sample post'
      expect(page).not_to have_content 'No posts yet...'
    end
  end

  context 'viewing a post' do
    let!(:post) { Post.create(description: 'Sample post') }

    scenario 'let a user view a post' do
      visit '/posts'
      click_link 'More'
      expect(page).to have_content 'Sample post'
      expect(current_path).to eq "/posts/#{post.id}"
    end
  end

  context 'posting a photo' do
    scenario 'display a form to fill out, then display the post' do
      visit '/posts'
      click_link 'Post a photo'
      fill_in 'Description', with: 'Sample post'
      click_button 'Post'
      expect(page).to have_content 'Sample post'
    end
  end

  context 'editing a post' do
    before { Post.create description: 'Old description' }

    scenario 'let a user edit a post' do
      visit '/posts'
      click_link 'Edit'
      fill_in 'Description', with: 'New description'
      click_button 'Update'
      expect(page).to have_content 'New description'
    end
  end
end
