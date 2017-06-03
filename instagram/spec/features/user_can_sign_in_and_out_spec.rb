require './spec/rails_helper'

RSpec.feature 'Sessions', type: :feature do

  scenario 'Authenticated User can log out', :type => :feature do
    sign_up
    click_link 'Logout'
    expect(page).to have_content('Signed out successfully.')
  end

  scenario 'Autenticated User can log in' do
    sign_up
    click_link 'Logout'
    login
    expect(page).to have_content('Logged in as example@email.com')
    expect(page).to have_content('Signed in successfully.')
  end

end
