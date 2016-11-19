require 'rails_helper'

feature 'posts' do
  context 'no posts have been added' do
    scenario 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Add a post'
    end
  end

  context 'posts have been added' do
    before do
      Post.create(caption: 'Woof')
    end

    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_content('Woof')
      expect(page).not_to have_content('No posts yet')
    end
  end

  context 'creating posts' do
    scenario 'tells user to fill in a form, then displays the new post' do
      visit '/posts'
      click_link 'Add a post'
      fill_in 'Caption', with: 'Amazing'
      click_button 'Create Post'
      expect(page).to have_content 'Amazing'
      expect(current_path).to eq '/posts'
    end
  end

  context 'viewing posts' do

    let!(:sunset){ Post.create(caption:'sunset') }

    scenario 'lets a user view a post' do
      visit '/posts'
      click_link 'sunset'
      expect(page).to have_content 'sunset'
      expect(current_path).to eq "/posts/#{sunset.id}"
    end
  end

  context 'editing posts' do

    before { Post.create caption: 'Sunset', description: 'Devon dreaming' }

    scenario 'let a user edit a post' do
      visit '/posts'
      click_link 'Edit Sunset'
      fill_in 'Caption', with: 'Devon sunset'
      fill_in 'Description', with: 'Devon dreaming'
      click_button 'Update Post'
      expect(page).to have_content 'Devon sunset'
      expect(page).to have_content 'Devon dreaming'
      expect(current_path).to eq '/posts'
    end
  end
  
  context 'deleting posts' do

    before { Post.create caption: 'Devon sunset', description: 'Devon dreaming' }

    scenario 'removes a post when a user clicks a delete link' do
      visit '/posts'
      click_link 'Delete Devon sunset'
      expect(page).not_to have_content 'Devon sunset'
      expect(page).to have_content 'Post deleted successfully'
    end
  end
end
