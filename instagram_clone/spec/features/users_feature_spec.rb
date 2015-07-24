require 'rails_helper'

feature 'users' do
  context 'if not yet signed up' do
    scenario 'should display a prompt to sign up' do
      visit '/users'
      expect(page).to have_content 'You aren\'t currently signed up'
      expect(page).to have_link 'Sign up now!'
    end
  end
end
