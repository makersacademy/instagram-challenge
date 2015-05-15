require 'rails_helper'

feature 'posts' do
  context 'user not signed in' do
    before do
      Post.create(title: 'Funny', body: 'The most funny post in history')
    end

    scenario 'is able to view the most recent posts' do
      visit '/posts'
      expect(page).to have_content 'Funny'
      expect(page).to have_content 'The most funny post in history'
    end
  end

  context 'signed in user' do
    before do
      Post.create(title: 'Funny', body: 'The most funny post in history')
      visit '/'
      sign_up
    end

    scenario 'is able to add new posts' do
      visit '/posts'
      fill_in 'Title', with: 'Look at this!'
      fill_in 'Body', with: 'This is a really cool story'
      click_button 'Post'
      expect(page).to have_content 'Look at this!'
      expect(page).to have_content 'This is a really cool story'
    end
  end
end
