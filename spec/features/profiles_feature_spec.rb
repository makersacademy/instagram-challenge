require 'rails_helper'

feature 'profile' do
  context 'no profiles have been added' do
    scenario 'should display a prompt signup' do
      visit '/profiles'
      expect(page).to have_content 'No profiles yet'
    end
    scenario 'a profile is added when a user signs up' do
      sign_up
      visit'/profiles'
      expect(page).to have_content 'test'
    end
  end
end
