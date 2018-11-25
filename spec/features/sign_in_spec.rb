# frozen_string_literal: true

require 'rails_helper'
require 'test_helper'

describe 'Sign in' do
  it 'Allows the user to sign in to their account' do
    sign_up
    click_link 'Log out'
    click_link 'Log In'
    fill_in 'Email', with: 'caitlin@test.com'
    fill_in 'Password', with: 'caitlin123'
    click_button 'Log in'
    expect(page).to have_content 'Caitlin'
  end
end
