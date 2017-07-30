require 'rails_helper'

feature 'users' do
  context 'user not registered' do
    scenario 'should display a form to let the user sign up' do
      sign_up
      expect(page).to have_content 'Welcome! You have signed up successfully.'
    end
  end
end
