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
  end
end
