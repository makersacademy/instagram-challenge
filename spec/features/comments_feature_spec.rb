require 'rails_helper'

feature 'commenting' do

  def sign_up_with(email)
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: email)
    fill_in('Password', with: 'testttest')
    fill_in('Password confirmation', with: 'testttest')
    click_button('Sign up')
  end

  def leave_comment(comment)
    click_link 'Leave a comment'
    fill_in 'Comment', with: comment
    click_button 'Leave Comment'
  end

  before {Photo.create caption: 'sunrise'}

  before(:each) do
    sign_up_with('test@example.com')
  end

  scenario 'allows users to leave a comment using a form' do
     leave_comment('nice photo')
     expect(current_path).to eq '/photos'
     expect(page).to have_content('nice photo')
  end

  scenario 'user can delete a comment' do
    leave_comment('nice photo')
    click_link 'Delete Comment'
    expect(page).not_to have_content('nice photo')
    expect(page).to have_content('Comment deleted successfully')
  end

  scenario 'user can delete only their own comments' do
    leave_comment("nice photo")
    click_link 'Sign out'
    sign_up_with('new@example.com')
    expect(page).not_to have_content('Delete Comment')
  end
end