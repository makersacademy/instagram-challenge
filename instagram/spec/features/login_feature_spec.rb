require 'rails_helper'
require_relative 'web_help_errors_signup'

RSpec.describe 'Login', type: :feature do
  scenario 'when an the login page a user' do
    visit('/login')
    fill_in_detail_for_login
    click_button('Log In')
    expect(page).to have_content('Sorry, your password was incorrect.')
  end
end