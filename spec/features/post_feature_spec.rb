require 'rails_helper'
require 'web_helper'

feature 'post' do
  context 'when no posts have yet been created' do
    scenario 'index should have a prompt to add a post' do
      visit('/posts')
      expect(page).to have_content('No posts to display')
      expect(page).to have_link('Add a post')
    end
  end

  context 'when a post has been added' do

    scenario 'should display the post in the index' do
      create_user
      create_post
      sign_in
      visit '/posts'
      expect(page).to have_content('My lovely photo')
      expect(page).not_to have_content('No posts to display')
    end
  end

  context 'a user can add a post' do
    scenario 'by filling in a form, then the post displays on the index page' do
      create_user
      sign_in
      visit('/posts')
      click_link('Add a post')
      fill_in 'Description', with: 'What a lovely photo'
      click_button('Create Post')
      expect(current_path).to eq('/posts')
      expect(page).to have_content('What a lovely photo')
      expect(page).not_to have_content('No posts to display')
    end
  end

  context 'a user can view a post' do

    scenario 'by clicking on the post' do
      create_user
      create_post
      sign_in
      visit('/posts')
      click_link('My lovely photo')
      expect(page).to have_content('My lovely photo')
      expect(current_path).to eq ("/posts/1")
    end
  end

  context 'a user can edit a post' do

    scenario 'by clicking the edit post link' do
      create_user
      create_post
      sign_in
      visit('/posts')
      click_link('Edit')
      fill_in 'Description', with: 'my brilliant photo'
      click_button('Update Post')
      click_link('my brilliant photo')
      expect(page).to have_content 'my brilliant photo'
      expect(page).not_to have_content 'My lovely photo'
      expect(current_path).to eq('/posts/1')
    end
  end

  context 'a user can delete a post' do

    scenario 'by clicking the delete post link' do
      create_user
      create_post
      sign_in
      visit('/posts')
      click_link('Delete')
      expect(page).not_to have_content('my lovely photo')
      expect(page).to have_content('No posts to display')
    end
  end

end
