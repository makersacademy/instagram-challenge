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
  scenario 'a user should not see the add image link when not signed in' do
    visit('/')
    expect(page).to_not have_link('Add an Image')
  end
  context 'a user signs in on the homepage' do
    before do
      @user = build(:user)
      sign_up(@user)
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
