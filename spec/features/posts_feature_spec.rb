require 'rails_helper'
require 'helpers/posts_helper_spec'

feature 'posts' do

  include PostsHelper

  context 'no posts have been added' do
    scenario 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Add a post'
    end
  end

  context 'creating posts' do
    scenario 'prompt user to fill out a form then displays the new post' do
      create_post('Awesome', 'It is awesome')
      expect(page).to have_content 'Awesome'
      expect(current_path).to eq '/posts'
    end
  end

  context 'post have been added' do
    before do
      create_post('Awesome', 'It is awesome')
    end

    scenario 'display post' do
      expect(page).to have_content 'Awesome'
      expect(page).not_to have_content 'No posts yet'
    end

    scenario 'let a user view a post' do
      click_link 'Awesome'
      expect(page).to have_content 'Awesome'
      expect(current_path).to eq "/posts/#{Post.last.id}"
    end

    scenario 'let a user edit a post' do
      edit_post('Amazing', 'Now it is amazing')
      expect(page).to have_content 'Amazing'
      expect(current_path).to eq '/posts'
    end
  end
end
