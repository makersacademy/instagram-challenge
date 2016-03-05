require 'rails_helper'
require_relative '../helpers/auth_helper'
require_relative '../helpers/post_helper'

feature 'posts' do
  include Auth, Posts

  context 'no posts have been posted' do
    scenario 'should display a prompt to add a post' do
      visit '/'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Add a post'
    end
  end

  context 'adding posts' do
    scenario 'visit new post and add a post' do
      sign_up(email: "asd@asd.com", password: "asdasdasd")
      new_post(title: "my first post")
      expect(current_path).to eq '/'
      expect(page).to have_content "my first post"
    end

    scenario 'cannot add a post if you haven\'t signed in first' do
      visit '/'
      click_link 'Add a post'
      expect(current_path).to eq ('/users/sign_in')
      expect(page).to have_content 'Log in'
    end

    scenario 'a user is able to upload a picture' do
      sign_up(email: "asd@asd.com", password: "asdasdasd")
      new_post(title: "kfc")
      expect(page).to have_content 'kfc'
      expect(page).to have_css('img')
    end

  end

  context 'editing posts' do

    scenario 'a user can edit a post' do
      Post.create(title: "test")
      sign_up(email: "asd@asd.com", password: "asdasdasd")
      click_link 'Edit test'
      expect(page).to have_content('Edit post')
      fill_in "Title", with: "test has been edited"
      click_button 'Update Post'
    end

    scenario 'a user can only edit his own posts' do
      sign_up(email: "asd@asd.com", password: "asdasdasd")
      new_post(title: "test")
      click_link 'Sign out'
      sign_up(email: "assdfdsd@asd.com", password: "asdasdasd")
      click_link 'Edit test'
      click_button 'Update Post'
      expect(page).to have_content 'You can only edit your own posts'
    end

  end

  context 'deleting posts' do

    scenario 'a user can delete a post' do
      sign_up(email: "asd@asd.com", password: "asdasdasd")
      new_post(title: "test")
      click_link 'Delete test'
      expect(page).to have_content('Post deleted')
    end

    scenario 'a user can only delete his own post' do
      sign_up(email: "asd@asd.com", password: "asdasdasd")
      new_post(title: "test")
      click_link 'Sign out'
      sign_up(email: "assdsdfd@asd.com", password: "asdasdasd")
      click_link 'Delete test'
      expect(page).to have_content('You can only delete your own posts')
    end

  end

end
