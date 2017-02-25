require 'rails_helper'

feature 'post' do
  context 'index when no posts have yet been created' do
    scenario 'should have a prompt to add a post' do
      visit('/posts')
      expect(page).to have_content('No posts to display')
      expect(page).to have_link('Add a post')
    end
  end

  context 'index when a post has been added' do
    before do
      Post.create(description: 'my lovely photo')
    end

    scenario 'should display the post in the index' do
      visit '/posts'
      expect(page).to have_content('my lovely photo')
      expect(page).not_to have_content('No posts to display')
    end
  end

  context 'adding a post' do
    scenario 'requires user to fill form, then displays the post on the index page' do
      visit('/posts')
      click_link('Add a post')
      fill_in 'Description', with: 'What a lovely photo'
      click_button('Create Post')
      expect(current_path).to eq('/posts')
      expect(page).to have_content('What a lovely photo')
      expect(page).not_to have_content('No posts to display')
    end
  end

end
