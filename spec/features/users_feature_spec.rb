require 'rails_helper'

feature 'users' do
  scenario 'not signed in' do
    visit '/'
    expect(page).to have_link 'Sign in'
    expect(page).to have_link 'Sign up'
    expect(page).not_to have_link 'Sign out'
  end

  scenario 'signed in' do
    signup
    expect(page).not_to have_link 'Sign in'
    expect(page).not_to have_link 'Sign up'
    expect(page).to have_link 'Sign out'
  end
end
