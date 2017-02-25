require 'rails_helper'

feature 'posts' do
  context 'no posts have been added' do
    scenario 'should display a prompt to add a posts' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Add a post'
    end
  end

  context 'posts have been added' do
    before do
      Post.create(description: 'Holiday')
    end

    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_content('Holiday')
      expect(page).not_to have_content('No posts yet')
    end
  end

  context 'creating posts' do
    scenario 'prompts user to fill out a form, then displays the new post' do
      visit '/posts'
      click_link 'Add a post'
      fill_in 'Description', with: 'Holiday'
      click_button 'Post'
      expect(page).to have_content 'Holiday'
      expect(current_path).to eq '/posts'
    end
  end

  context 'viewing posts' do
    let!(:holiday){ Post.create(description: 'Holiday') }

    scenario 'lets a user view a post' do
      visit '/posts'
      click_link 'Holiday'
      expect(page).to have_content 'Holiday'
      expect(current_path).to eq "/posts/#{holiday.id}"
    end
  end

  context 'deleting posts' do
    before { Post.create description: 'Holiday' }

    scenario 'removes a post when a user clicks a delete link' do
      visit '/posts'
      click_link 'Delete Holiday'
      expect(page).not_to have_content 'Holiday'
      expect(page).to have_content 'Post deleted successfully'
    end
  end
end
