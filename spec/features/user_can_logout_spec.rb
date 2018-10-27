require 'rails_helper'
require 'rake'

RSpec.feature 'Log Out', type: :feature do
  before do
    sign_up_helper
  end

  context 'A signed in user' do
    scenario 'can see a logout button' do
      expect(page).to have_selector('#log-out')
    end

    scenario 'can log out' do
      click_on('Logout')
      expect(find('.notice')).to have_content('Signed out successfully.')
    end
  end
end
