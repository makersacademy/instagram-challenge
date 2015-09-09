require 'rails_helper'

feature 'Liking images' do
  before(:each) do
    visit '/posts'
    user = create(:user)
    sign_in_as(user)
    create(:post, user: user)
  end

  scenario 'started with 0 likes' do
    visit '/posts'
    expect(page).to have_content('0 likes')
  end

  scenario 'user likes a picture, updates the count', js: true do
    visit '/posts'
    click_link 'Like'
    expect(page).to have_content('1 like')
  end

  context 'Liking - users are only allowed to like a post once', js: true do
    scenario '1 user trying to like twice would only increase like once' do
      visit '/posts'
      click_link 'Like'
      click_link 'Like'
      expect(page).to have_content('1 like')
    end

    scenario '2 users liking a post' do
      visit '/posts'
      click_link 'Like'
      click_link 'Sign out'
      user2 = create(:user, email: 'another@person.com', username: 'anotherperson')
      sign_in_as(user2)
      click_link 'Like'
      visit '/posts'
      expect(page).to have_content('2 likes')
    end
  end

  context 'Unliking', js: true do
    scenario 'remove your like and decrease like count' do
      visit '/posts'
      click_link 'Like'
      click_link 'Unlike'
      expect(page).to have_content('0 likes')
    end

    scenario 'redirected to posts page if user clicks unlike twice' do
      visit '/posts'
      click_link 'Unlike'
      expect(current_path).to eq('/')
    end
  end

end
