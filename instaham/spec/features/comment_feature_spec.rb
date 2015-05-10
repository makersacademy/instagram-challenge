require 'rails_helper'

def sign_up
  visit '/'
  click_link 'Join in'
  fill_in 'Email', with: 'test@test.com'
  fill_in 'Password', with: 'testtest'
  fill_in 'Password confirmation', with: 'testtest'
  click_button 'Join in'
end

def sign_up_and_add_msg
  sign_up
  visit '/photos'
  click_link 'Add Photo'
  fill_in 'Message', with: 'My first post'
  click_button 'Add my photo'
end

feature 'comments' do
  context 'logged in' do
    scenario 'user can comment on a photo' do
      sign_up_and_add_msg
      visit '/photos'
      click_link 'Comment on this photo'
      fill_in 'Comment', with: "I'm leaving a comment!"
      click_button 'Post comment'
      expect(Photo.find_by_message('My first post').comments.count).to eq 1
      expect(current_path).to eq '/'
      expect(page).to have_content "I'm leaving a comment"
    end
  end

  context 'logged out' do
    scenario 'cannot comment on a photo' do
      sign_up_and_add_msg
      click_link 'Sign out'
      visit '/photos'
      expect(page).not_to have_content 'Comment on this photo'
      id = Photo.find_by_message('My first post').id
      visit "/photos/#{id}/comments/new"
      expect(page).not_to have_content 'Post comment'
      expect(current_path).to eq '/users/sign_in'
      expect(page).to have_content "Please sign in to add your ham!"
    end
  end
end