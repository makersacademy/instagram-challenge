require 'rails_helper'

feature 'users' do
  scenario 'buttons correct when not signed in' do
    visit '/'
    expect(page).to have_link 'Sign in'
    expect(page).to have_link 'Sign up'
    expect(page).not_to have_link 'Sign out'
  end

  scenario 'buttons correct when signed in' do
    signup
    expect(page).not_to have_link 'Sign in'
    expect(page).not_to have_link 'Sign up'
    expect(page).to have_link 'Sign out'
  end
end
