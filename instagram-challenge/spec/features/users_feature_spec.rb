require 'rails_helper'

feature 'User while on a homepage' do
  context 'and not signed in' do
    it 'can see sign up and sign in links' do
      visit '/pictures'
      expect(page).to have_link "Sign up"
      expect(page).to have_link "Sign in"
    end
    it 'should not see sign out link' do
      expect(page).not_to have_link "Sign out"
    end
  end
end