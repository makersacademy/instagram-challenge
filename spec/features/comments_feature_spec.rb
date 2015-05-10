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
      sign_up('test@test.com', 'username', 'testpassword')
      create_post('Awesome', 'This is awesome')
      click_link 'Sign out'
      go_to_view_page('Rubber duck')
      expect(page).not_to have_link 'Comment'
    end
  end

  context 'user logged in' do
    before do
      sign_up('test@test.com', 'username', 'testpassword')
      create_post('Awesome', 'This is awesome')
      go_to_view_page('Rubber duck')
    end

    scenario 'can leave a comment using a form' do
      create_comment 'This is a comment'
      expect(page).to have_content 'This is a comment'
      expect(current_path).to eq "/posts/#{Post.last.id}"
    end

    scenario 'cannot leave a comment without text' do
      click_link 'Comment'
      click_button 'Leave Comment'
      expect(page).to have_css('.field_with_errors')
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
        go_to_view_page('Rubber duck')
        expect(page).to have_content 'This is a comment'
        expect(page).not_to have_css('.edit_comment')
      end

      scenario 'cannot edit a comment without text' do
        find('.edit_comment').click
        click_button 'Edit Comment'
        expect(page).to have_content('This is a comment')
      end

      scenario 'can delete a comment' do
        find('.remove_comment').click
        expect(page).not_to have_content 'This is a comment'
        expect(page).not_to have_css('.remove_comment')
      end

      scenario 'cannot delete a post if he is not the creator' do
        click_link 'Sign out'
        sign_up('another@test.com', 'another', 'testpassword')
        go_to_view_page('Rubber duck')
        expect(page).to have_content 'This is a comment'
        expect(page).not_to have_css '.delete_comment'
      end

      scenario 'all comments will be deleted if the post is deleted' do
        find('.remove_post').click
        expect(page).not_to have_content 'This is a comment'
        expect(current_path).to eq '/posts'
      end
    end
  end
end