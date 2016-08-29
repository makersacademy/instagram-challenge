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
      Post.create(title:'dog', description:'adorable')
    end

    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_content('dog')
      expect(page).not_to have_content('No posts yet')
    end
  end

  context 'creating posts' do
    scenario 'prompts user to fill out a form, then displays the new post' do
      visit '/posts'
      click_link 'Add a post'
      fill_in 'Title', with: 'dog'
      fill_in 'Description', with: 'adorable'
      click_button 'Create Post'
      expect(page).to have_content 'dog'
      expect(current_path).to eq '/posts'
    end
  end

  context 'viewing posts' do

    let!(:dog){ Post.create(title:'dog', description:'adorable') }

    scenario 'lets a user view a post' do
     visit '/posts'
     click_link 'dog'
     expect(page).to have_content 'adorable'
     expect(current_path).to eq "/posts/#{dog.id}"
    end

  end

  context 'editing restaurants' do

    before { Post.create(title: 'dog', description: 'adorable') }

    scenario 'let a user edit a post' do
      visit '/posts'
      click_link 'Edit dog'
      fill_in 'Title', with: 'dog'
      fill_in 'Description', with: 'adorable'
      click_button 'Update Post'
      expect(page).to have_content 'dog'
      expect(page).to have_content 'adorable'
      expect(current_path).to eq '/posts'
    end

  end

  context 'deleting posts' do

    before { Post.create title: 'dog', description: 'adorable' }

    scenario 'removes a post when a user clicks a delete link' do
      visit '/posts'
      click_link 'Delete dog'
      expect(page).not_to have_content 'dog'
      expect(page).to have_content 'Post deleted successfully'
    end

  end
end
