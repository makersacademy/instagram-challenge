# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'User', type: :feature do
  scenario 'Can sign up for account' do
    visit '/'
    click_link 'Sign Up'
    fill_in 'Email', with: 'influencer@cool.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content('You have signed up successfully.')
  end

end
