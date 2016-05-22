require 'rails_helper'

feature "User can sign in and out" do
  context 'user not signed in and on the homepage' do
    it "shows a sign in link and a sign up link" do
      visit '/'
      expect(page).to have_link 'Sign in'
      expect(page).to have_link 'Sign up'
    end

    it 'not shows sign out link' do
      visit '/'
      expect(page).not_to have_link "Sign out"
    end
  end

  context 'user signed in on the homepage' do
    before do
      sign_up_user1
    end

    it 'shows sign out link' do
      expect(page).to have_link 'Sign out'
    end

    it 'not shows a sign in and sign out link' do
      expect(page).not_to have_link 'Sign in'
      expect(page).not_to have_link 'Sign up'
    end
  end
end