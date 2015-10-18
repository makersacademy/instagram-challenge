require 'rails_helper'

feature 'users' do
  scenario 'a user should not be signed in on the homepage' do
    visit('/')
    expect(page).to have_link('Sign in')
    expect(page).to have_link('Sign up')
  end
  scenario 'a user should not see the sign out button' do
    visit('/')
    expect(page).to_not have_link('Sign out')
  end
  context 'a user signs in on the homepage' do
    before do
      visit('/')
      click_link('Sign up')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button('Sign up')
    end
    scenario 'user should see the sign out link' do
      visit('/')
      expect(page).to have_link('Sign out')
    end
    scenario 'user should not see sign in or up link' do
      visit('/')
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end
  end
end
