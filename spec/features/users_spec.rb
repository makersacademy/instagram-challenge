require 'rails_helper'

feature 'Signing up' do

  scenario 'users can sign up to start using travelgram' do
    visit '/users/sign-up'
    fill_in "Email", with: 'camilla@email.com'
    fill_in "Password", with: 'pass1234'
    click_button 'Sign up'
    expect(page).to have_content 'Welcome back!'
    expect(current_path).to eq '/photos'
  end

end

feature 'Signing in' do

end

feature 'Signing out' do

end
