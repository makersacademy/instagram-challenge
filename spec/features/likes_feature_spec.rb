require 'rails_helper'

feature 'liking pictures' do

  let(:user){build :user}

  before do
    sign_up(user)
    add_picture('tower_bridge')
  end

  scenario 'a user can like a picture, which updates the picture like count' do
    visit '/'
    click_link 'Like'
    expect(page).to have_content('1 like')
  end

  scenario 'a user can only like a picture once' do
    visit '/'
    click_link 'Like'
    click_link 'Like'
    expect(page).to_not have_content('2 likes')
    expect(page).to have_content('You have already liked this picture')
  end

  scenario 'can not like a picture while not signed in' do
    visit('/')
    click_link('Sign out')
    click_link('Like')
    expect(page).to_not have_content('1 like')
  end
end
