# frozen_string_literal: true

require './spec/rails_help'
require './spec/spec_helpers/sign_in_helper'

RSpec.feature 'Sign up page', type: :feature do
  scenario 'User can sign up' do
    sign_up 
    expect(page).to have_content('Successfully created account')
  end

  scenario 'User cannot use an email already registered' do 
    sign_up
    click_button 'Logout'
    sign_up
    expect(page).to have_content('Please enter a new email address')
  end
end