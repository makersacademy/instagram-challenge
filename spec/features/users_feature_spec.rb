require 'rails_helper'

RSpec.feature 'Users Features' do
  context 'when user is not signed in' do
    scenario 'they should see links for sign in and sign up' do
      visit '/'
      expect(page).to have_link 'Sign In'
      expect(page).to have_link 'Sign Up'
    end
  end
end
