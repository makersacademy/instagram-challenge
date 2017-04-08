require 'rails_helper'

feature 'user' do
  context 'user can sign up' do
    scenario 'should display a sign up button' do
      visit '/pictures'
      expect(page).to have_content 'sign up'
      # expect(page).to have_link 'sign up'
    end
  end
end
