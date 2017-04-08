require 'rails_helper'

feature 'liking a post' do

  context 'visitor to the website' do
    before do
      @post = Post.create(image:File.new('/Users/ashwinimani/Pictures/indian_food.jpg'), description: 'delicious')
    end

    scenario 'will not be able to like posts' do
      visit('/posts')
      expect(page).to have_content 'delicious'
      expect(page).not_to have_link "♡"
    end

  end

  context 'user signed in' do
    before do
      user_sign_up
      add_new_post
    end

    scenario 'a user can like a post which updates the likes count', js: true do
      visit '/posts'
      click_link "♡"
      expect(page).to have_content '♥ 1 like'
    end

    scenario 'a user cannot like a post more than once', js: true do
      visit '/posts'
      click_link "♡"
      expect(page).to have_content '♥ 1 like'
      expect(page).not_to have_link("♡")
    end
  end

end
