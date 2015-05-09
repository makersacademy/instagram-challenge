require 'rails_helper'
require 'helpers/users_helper_spec'
require 'helpers/posts_helper_spec'
require 'helpers/comments_helper_spec'

feature 'comments' do

  include UsersHelper
  include PostsHelper
  include CommentsHelper

  context 'user not logged in' do
    scenario 'cannot comment posts' do
      expect(page).not_to have_link 'Comment'
    end
  end

  context 'user logged in' do
    before do
      sign_up('test@test.com', 'username', 'testpassword')
      create_post('Awesome', 'This is awesome')
    end

    scenario 'can leave a comment using a form' do
      create_comment 'This is a comment'
      expect(page).to have_content 'This is a comment'
      expect(current_path).to eq '/posts'
    end

    context 'after a comment has been created' do
      before do
        create_comment('This is a comment')
      end

      scenario 'can edit a comment' do
        edit_comment('This is an edited comment')
        expect(page).not_to have_content 'This is a comment'
        expect(page).to have_content 'This is an edited comment'
      end

      scenario 'cannot edit a post if he is not the creator' do
        click_link 'Sign out'
        sign_up('another@test.com', 'another', 'testpassword')
        expect(page).to have_content 'This is a comment'
        expect(page).not_to have_link 'Edit comment'
      end

      scenario 'can delete a comment' do
        click_link 'Delete comment'
        expect(page).not_to have_content 'This is a comment'
      end

      scenario 'cannot delete a post if he is not the creator' do
        click_link 'Sign out'
        sign_up('another@test.com', 'another', 'testpassword')
        expect(page).to have_content 'This is a comment'
        expect(page).not_to have_link 'Delete comment'
      end

      scenario 'all comments will be deleted if the post is deleted' do
        click_link 'Delete post'
        expect(page).not_to have_content 'This is a comment'
        expect(current_path).to eq '/posts'
      end
    end
  end
end