require 'rails_helper'
# As a user
# So that I can post pictures on Instagram
# I would like to create my own account
feature 'Users' do
  let(:user) { create :user, :first}
  scenario 'can sign up' do
    visit '/'
    click_button 'Sign up'
    fill_in 'Name', with: 'Jessica Jones'
    fill_in 'Username', with: 'jessicajones'
    fill_in 'Email', with: 'jessica@alias.com'
    fill_in 'Password', with: 'aliaspi1'
    fill_in 'Password confirmation', with: 'aliaspi1'
    click_button 'Submit'
    expect(page).to have_content 'Welcome'
  end

  scenario 'can sign in' do
    visit '/'
    click_button 'Sign in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
  end

  scenario 'can sign out' do
    sign_in(user.email, user.password)
    click_button 'Sign out'
    expect(page).to have_content 'Signed out successfully.'
  end
end
