require 'rails_helper'

feature 'Signing up' do

  scenario 'users can sign up to start using travelgram' do
    visit '/'
    sign_up(email: 'camilla@email.com', password: 'pass1234')
    expect(page).to have_content 'Welcome!'
    expect(current_path).to eq '/'
  end

end

feature 'Logging in' do

  background do
    visit '/'
    sign_up(email: 'camilla@email.com', password: 'pass1234')
    click_link 'Log out'
  end

  scenario 'users have default avatar image' do
    visit '/'
    log_in(email: 'camilla@email.com', password: 'pass1234')
    expect(page).to have_css('img', 'missing.png')
    expect(current_path).to eq '/'
  end

  scenario 'users can sign in into travelgram' do
    visit '/'
    log_in(email: 'camilla@email.com', password: 'pass1234')
    expect(page).to have_content 'Welcome back!'
    expect(current_path).to eq '/'
  end

end

feature 'Signing out' do

  background do
    visit '/'
    sign_up(email: 'camilla@email.com', password: 'pass1234')
  end

  scenario 'users can sign out from travelgram' do
    visit '/'
    click_link 'camilla@email.com'
    click_link 'Log out'
    expect(page).not_to have_content 'camilla@email.com'
    expect(page).to have_content 'See you soon!'
    expect(current_path).to eq '/'
  end

end
