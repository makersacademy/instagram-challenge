require 'rails_helper.rb'
require 'spec_helper.rb'
require 'helpers/user_helper.rb'

feature 'Sign Up' do
  scenario 'user can sign up' do
    sign_up
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end
end
