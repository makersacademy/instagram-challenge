require 'rails_helper'

feature 'Following' do

  before do
    sign_up(username: 'user1', email: 'user1@test.com')
    create_photo(description: 'user1 photo')
    sign_out
    sign_up(username: 'user2', email: 'user2@test.com')
  end

  scenario 'user can follow another user' do
    visit '/user1'
    click_link 'Follow'
    expect(page).to_not have_link 'Follow'
    expect(page).to have_link 'Unfollow'
  end

  scenario 'user can unfollow another user' do
    visit '/user1'
    click_link 'Follow'
    click_link 'Unfollow'
    expect(page).to have_link 'Follow'
    expect(page).to_not have_link 'Unfollow'
  end

  scenario 'user cannot follow his/her own page' do
    visit '/user2'
    expect(page).to_not have_link 'Follow'
    expect(page).to_not have_link 'Unfollow'
  end

  scenario 'must be logged in to follow' do
    sign_out
    visit '/user1'
    click_link 'Follow'
    expect(current_path).to eq '/users/sign_in'
  end

end
