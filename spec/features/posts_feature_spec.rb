require 'rails_helper'
require 'helpers/users_helper_spec'
require 'helpers/posts_helper_spec'

feature 'posts' do

  include UsersHelper
  include PostsHelper

  context 'user not logged in' do
    scenario 'should not display a prompt to add a post' do
      expect(page).not_to have_link 'Add a post'
    end
  end

  context 'user logged in' do

    before do
      sign_up('test@test.com', 'username', 'testpassword')
    end

    context 'no posts have been added' do
      scenario 'should display a prompt to add a post' do
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

      scenario 'post should belong to a user' do
        create_post('Awesome', 'It is awesome')
        expect(page).to have_content 'username'
      end

      scenario 'does not let you submit a title that is too short' do
        create_post('Aw', 'It is not so awesome')
        expect(page).not_to have_content 'Aw'
        expect(page).to have_content 'error'
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
        expect(page).to have_content 'username'
        expect(current_path).to eq "/posts/#{Post.last.id}"
      end

      scenario 'let a user edit a post' do
        edit_post('Amazing', 'Now it is amazing')
        expect(page).to have_content 'Amazing'
        expect(current_path).to eq '/posts'
      end

      scenario 'cannot edit a post if he is not the creator' do
        click_link 'Sign out'
        sign_up('another@test.com', 'another', 'testpassword')
        expect(page).to have_content 'Awesome'
        expect(page).not_to have_link 'Edit post'
      end

      scenario 'remove a post when a user clicks on delete link' do
        click_link 'Delete post'
        expect(page).not_to have_content 'Awesome'
        expect(page).to have_content 'Post deleted successfully'
      end

      scenario 'cannot delete a post if he is not the creator' do
        click_link 'Sign out'
        sign_up('another@test.com', 'another', 'testpassword')
        expect(page).to have_content 'Awesome'
        expect(page).not_to have_link 'Delete post'
      end
    end
  end
end
