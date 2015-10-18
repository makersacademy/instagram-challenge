require 'rails_helper'

feature 'likes' do

  scenario 'like count is displayed on posts' do
    user = build(:user)
    sign_up(user)
    make_post 'like me'
    expect(page).to have_content('0 likes')
  end

  scenario "like count is increased by one when 'like' is clicked by user" do
    user = build(:user)
    sign_up(user)
    make_post 'like me please :)'
    click_link 'Like'
    expect(page).to have_content('1 like')
  end

  scenario "users 'like' is removed if they click 'unlike'" do
    user = build(:user)
    sign_up(user)
    make_post 'like me please :)'
    click_link 'Like'
    click_link 'Unlike'
    expect(page).to have_content('0 likes')
  end

  scenario 'likes can only be made by signed in users' do
    visit '/posts'
    expect(page).to_not have_content('Like')
  end

end
