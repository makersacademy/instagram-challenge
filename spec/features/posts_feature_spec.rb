require 'rails_helper'

feature 'posts' do
  context 'no posts have been added' do
    scenario 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Add a post'
    end
  end

  context 'an invalid post' do
    it 'does not let you submit a comment that is too long' do
      description = 'This description is way too long, and so the validation should make this an invalid description and raise an error to notifying the user to shorten their description content to a maximum of 200 characters.'
      visit '/posts'
      click_link 'Add a post'
      fill_in 'Title', with: 'This title is way too long, it should raise an error'
      fill_in 'Description', with: description
      click_button 'Create Post'
      expect(page).not_to have_content description
      expect(page).not_to have_content 'This title is way too long, it should raise an error'
      expect(page).to have_content 'error'
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
