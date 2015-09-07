require 'rails_helper'

feature 'likeing photos' do

    before do
      user = create(:user) do |user|
        user.photos.create(attributes_for(:photo))
      end
      sign_in_as(user)
    end


  context 'user is logged in' do

    scenario 'a user can like a photo, which updates the like count', js: true do
      visit photos_path
      click_link 'Like'
      expect(page).to have_content('1 like')
    end

    scenario 'a user can only like one photo once', js: true do
      visit photos_path
      click_link 'Like'
      click_link 'Like'
      click_link 'Like'
      expect(page).to have_content('1 like')
    end

  end

  context 'user is not logged in' do
    scenario 'user has to be logged in to like a photo', js: true do
      visit photos_path
      click_link 'Sign out'
      click_link 'Like'
      expect(page).to have_content('0 likes')
    end
  end
end

feature 'multiple users liking photos' do

  before do
    user = create(:user) do |user|
      user.photos.create(attributes_for(:photo))
    end
    sign_in_as(user)
    visit photos_path
    click_link 'Like'
    click_link 'Sign out'
    user_two = create(:user_two)
    sign_in_as(user_two)
  end

  context 'after one user likes a photo another logs in', js: true  do
    scenario 'like already liked photo' do
      visit photos_path
      click_link 'Like'
      expect(page).to have_content('Like 2')
    end
  end
end

