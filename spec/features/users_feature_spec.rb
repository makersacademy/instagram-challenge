require 'rails_helper'

feature 'User can sign in and out' do
  context 'user is not signed in and on the homepage' do
    scenario "display 'sign in' and 'sign up' links" do
      visit '/'
      expect(page).to have_link 'Sign in'
      expect(page).to have_link 'Sign up'
    end

    scenario "do not display a 'sign out' link" do
      visit '/'
      expect(page).not_to have_link 'Sign out'
    end
  end

  context 'user is signed in and on the homepage' do
    before { sign_up }

    scenario "display a 'sign out' link" do
      visit '/'
      expect(page).to have_link 'Sign out'
    end

    scenario "do not display 'sign in' and 'sign out' links" do
      visit '/'
      expect(page).not_to have_link 'Sign in'
      expect(page).not_to have_link 'Sign up'
    end
  end
end
