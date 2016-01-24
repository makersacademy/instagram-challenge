require 'rails_helper'

RSpec.feature 'Posts Features' do
  context 'when no posts have been posted' do
    scenario 'there is a link to add an image and a prompt to start' do
      visit '/posts'

      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Create Post'
    end
  end

  context 'creating a post' do
    context 'while signed in' do
      before(:each) do
        user = FactoryGirl.create(:user)
        login_as(user)
      end

      scenario 'a user can create a new post' do
        visit '/posts'
        click_link 'Create Post'
        attach_file :post_image, './spec/images/cat.png'
        fill_in 'Description', with: 'A random cat'
        click_button 'Post It!'

        expect(current_path).to eq posts_path
        expect(page).to have_css 'img[src*=\'cat.png\']'
        expect(page).to have_content 'A random cat'
      end
    end

    context 'while not signed in' do
      scenario 'a user cannot create a new post' do
        visit '/posts'
        click_link 'Create Post'

        expect(current_path).to eq new_user_session_path
        expect(page).to have_content 'You need to sign in or sign up'
      end
    end
  end

  context 'deleting a post' do
    context 'while signed in' do
      before(:each) do
        user = FactoryGirl.create(:user)
        login_as(user)
      end

      scenario 'a user can delete their own post' do
        visit '/posts'
        click_link 'Create Post'
        attach_file :post_image, './spec/images/cat.png'
        fill_in 'Description', with: 'A random cat'
        click_button 'Post It!'

        click_link 'Delete Post'

        expect(current_path).to eq posts_path
        expect(page).to have_content 'Post deleted successfully'
        expect(page).not_to have_css 'img[src*=\'cat.png\']'
        expect(page).not_to have_content 'A random cat'
      end

      scenario 'a user should not see a delete link for someone elses post' do

      end
    end
  end
end
