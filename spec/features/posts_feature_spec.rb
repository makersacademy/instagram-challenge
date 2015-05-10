require 'rails_helper'

feature 'posts' do
  ## Helper Methods ##
  def add_post
    visit '/posts'
    click_link 'Add a post'
    fill_in 'Title', with: 'Beach'
    click_button 'Create Post'
  end

  ###

  context 'No posts have been made' do
    scenario 'should display homepage + prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet!'
      expect(page).to have_link 'Add a post'
    end
  end

  context 'Post has been added' do
    before do
      Post.create(title: 'Beach')
    end

    scenario 'display restaurants' do
      visit '/posts'
      expect(page).to have_content('Beach')
      expect(page).not_to have_content('No posts yet!')
    end
  end

  context 'Adding a post' do
    scenario 'can add a post' do
      add_post
      expect(page).to have_content 'Beach'
    end

    scenario 'can view a post in more detail' do
      add_post
      click_link('Beach')
      expect(page).to have_content 'Title: Beach'
    end
  end

  context 'Posts can be deleted' do
    scenario 'can delete a post' do
      add_post
      click_link 'Delete Beach'
      expect(page).not_to have_content 'Beach'
      expect(page).to have_content 'Post deleted'
    end
  end

  context 'Posts can have images attached' do
    scenario 'can add an image' do
      visit '/posts'
      click_link 'Add a post'
      fill_in 'Title', with: 'Beach'
      attach_file 'post_image', 'spec/features/fixtures/files/beach.jpg'
      click_button 'Create Post'
      expect(page).to have_content 'Beach'
      # Work out how to make capybara work with user uploaded images.
    end
  end
end
