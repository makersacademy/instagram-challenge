# frozen_string_literal: true

require './spec/rails_help'

RSpec.feature 'Sign up page', type: :feature do
  scenario 'User can sign up' do
    visit '/sign_up'
    fill_in 'user[first_name]', with: 'Joe'
    fill_in 'user[last_name]', with: 'Bloggs'
    fill_in 'user[email]', with: 'joebloggs@test.com'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content('Successfully created account')
  end
end