require 'rails_helper'
require 'rake'

RSpec.feature 'Sign in', type: :feature do
  before do
    sign_up_helper
    click_on('Logout')
  end

  context 'An existing user' do
    scenario 'can sign in' do
      log_in_helper('test@email.com', 'Testing123')
      expect(find('.notice')).to have_content('Signed in successfully.')
    end
  end
end
