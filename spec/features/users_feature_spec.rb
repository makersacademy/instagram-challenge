require 'rails_helper'

feature 'Users' do
  context 'user not signed in and on the homepage' do
    scenario 'should see a sign in link and a sign up link' do
      visit '/'
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
    end

    scenario 'should not see sign out link' do
      visit '/'
      expect(page).not_to have_link('Sign out')
    end
  end

  context 'user signed in and on the homepage' do
    before do
      user = build(:user)
      sign_up_as(user)
    end

    scenario 'should see sign out link' do
      visit '/'
      expect(page).to have_link('Sign out')
    end

    scenario 'should not see sign in or sign up link' do
      visit '/'
      expect(page).not_to have_link('Sign up')
      expect(page).not_to have_link('Sign in')
    end
  end

end
