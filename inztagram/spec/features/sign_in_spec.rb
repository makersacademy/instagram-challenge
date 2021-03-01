require './spec/rails_help'
require './spec/spec_helpers/sign_in_helper'
require './spec/spec_helpers/sign_up_helper'

RSpec.feature 'Sign in page', type: :feature do
  scenario 'User can sign in' do
    sign_up 
    click_button 'Logout'
    sign_in
    expect(page).to have_content('Logged in successfully')
  end

  scenario 'User cannot use an email already registered' do 
    visit '/sign_in'
    fill_in 'email', with: 'joebloggs@test.com'
    fill_in 'password', with: 'failed'
    click_button 'Log in'
    expect(page).to have_content('Invalid email or password')
  end
end