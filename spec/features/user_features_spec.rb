require 'rails_helper'

feature 'user' do
  context 'visiting the homepage' do
    scenario 'should be able to sign up' do
      visit '/'
      expect(page).to have_content 'Instagram'
      expect(page).to have_link 'Sign up'
    end
  end
end
