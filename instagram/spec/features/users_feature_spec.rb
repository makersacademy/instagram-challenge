require 'rails_helper'

feature 'user can sign in and out' do
  context 'user not signed in on homepage' do
    it 'should see sign up and sign in links' do
      visit '/'
      expect(page).to have_link 'Sign up'
      expect(page).to have_link 'Sign in'
    end

    it 'should not see a sign out link' do
      visit '/'
      expect(page).not_to have_link 'Sign out'
    end

    it 'should not be able to post a photo' do
      visit '/'
      click_link 'Post a photo'
      expect(page).not_to have_content "Caption"
      expect(page).to have_content "Log in"
    end

    it 'should not be able to post a comment' do
      sign_up
      post_photo
      click_link 'Sign out'
      visit '/'
      click_link 'My Lunch'
      click_link 'Comment'
      expect(page).not_to have_content "Thoughts"
      expect(page).to have_content "Log in"
    end
  end

  context 'user signed in on homepage' do
    before do
      sign_up
    end

    it 'should see a sign out link' do
      visit '/'
      expect(page).to have_link 'Sign out'
    end

    it 'should not see sign up and sign in links' do
      visit '/'
      expect(page).not_to have_link 'Sign in'
      expect(page).not_to have_link 'Sign up'
    end
  end
end
