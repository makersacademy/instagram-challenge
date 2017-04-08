require 'rails_helper'

feature 'posts' do

  context 'no posts have been added' do

    scenario 'should display a prompt to add post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Add a post'
    end

  end

  context 'posts can be added' do
    before do
      add_new_post
    end

    scenario 'display posts' do
      expect(page).to have_content 'Delicious home made food'
      expect(page).not_to have_content 'No posts yet'
    end

  end

end
