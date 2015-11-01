require 'rails_helper'

feature 'User can sign in and out' do

  before do
    visit '/'
  end

  context 'when not signed in and on the homepage' do

    scenario "should see 'sign in' and 'sign up' links" do
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
    end

    scenario "should not see 'sign out' link" do
      expect(page).not_to have_link('Sign out')
    end

  end

  context "when signed in on the homepage" do

    before do
      click_link('Sign up')
      fill_in('Username', with: 'TestyTim12')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button('Sign up')
    end

    scenario "should see 'sign out' link" do
      expect(page).to have_link('Sign out')
    end

    scenario "should not see 'sign in' or 'sign up' links" do
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end

  end

end
