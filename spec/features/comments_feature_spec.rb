require 'rails_helper'

feature 'comments' do

  scenario 'user must be logged in to create a comment' do
    user = build(:user)
    sign_up(user)
    make_post 'whatever bro'
    click_link 'Sign out'
    visit '/posts'
    click_link 'Comment'
    expect(page).not_to have_content 'Leave Comment'
    expect(current_path).to eq '/users/sign_in'
  end

  scenario 'allows users to leave a comment' do
    user = build(:user)
    sign_up(user)
    make_post 'hey'
    make_comment 'hey yourself'
    expect(current_path).to eq '/posts'
    expect(page).to have_content('hey yourself')
  end

  scenario 'allows users to delete their own comments' do
    user = build(:user)
    sign_up(user)
    make_post 'hey you'
    make_comment 'hey yourself'
    click_link 'Delete comment'
    expect(page).to_not have_content('hey yourself')
  end

  scenario 'users cannot delete others comments' do
    user = build(:user)
    user2 = build(:user, email: "different@gmail.com")
    sign_up(user)
    make_post 'hey you'
    click_link 'Sign out'
    sign_up(user2)
    expect(page).to_not have_content('Delete Comment')
  end

end
