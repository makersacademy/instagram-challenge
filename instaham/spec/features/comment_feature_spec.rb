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
      expect(current_path).to eq '/'
      expect(page).to have_content "I'm leaving a comment"
    end
  end

# signed out, linked to photo, dependent destory,
end