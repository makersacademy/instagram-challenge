require 'rails_helper'

feature 'User can sign in and out' do
  context 'user not signed in and on the homepage' do
    scenario 'user should see a "Sign in" and a "Sign up" link' do
      visit '/'
      expect(page).to have_link'Sign in'
      expect(page).to have_link'Sign up'
    end

    scenario 'user should not see "Sign out" link' do
      visit'/'
      expect(page).not_to have_link 'Sign out'
    end

    scenario 'user can "Sign in" with facebook' do
      visit '/'
      click_link 'Sign in'
      expect(page).to have_link 'Sign in with Facebook'
    end

    scenario 'user needs to sign in before posting' do
      visit '/'
      click_link 'Post a photo'
      expect(page).to have_content 'Log in'
      expect(page).not_to have_button 'Post'
    end
  end

  context 'user signed in on the homepage' do
    before do
      sign_up
    end

    scenario 'user should see "Sign out" link' do
      visit '/'
      expect(page).to have_link 'Sign out'
    end

    scenario 'user should not see a "Sign in" and a "Sign up" link' do
      visit '/'
      expect(page).not_to have_link 'Sign in'
      expect(page).not_to have_link 'Sign up'
    end
  end
end
