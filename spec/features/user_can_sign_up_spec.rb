require 'rails_helper'
require 'rake'

RSpec.feature 'Sign up', type: :feature do
  scenario 'shows sign-up page with email/password prompt' do
    visit '/'
    expect(page).to have_selector('#user_email')
    expect(page).to have_selector('#user_password')
  end

end
