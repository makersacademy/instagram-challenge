require 'rails_helper'

RSpec.feature 'User Sign In', type: :feature do
  scenario 'the user see prompts for email and password' do
    visit '/'
    click_link 'Log in'
    expect(current_path).to eq '/users/sign_in'
    expect(page).to have_content 'Email'
    expect(page).to have_content 'Password'
  end

  scenario 'the user can sign in with an existing account' do
    user = FactoryBot.create(:user)
    login_as(user)
    expect(page).to have_content 'Signed in successfully.'
  end

  scenario 'the user can only enter valid email and password' do
    user = FactoryBot.create(:user)
    visit '/users/sign_in'
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: '123456'
    click_button 'Log in'
    expect(page).to have_content 'nvalid Email or password.'
  end

  scenario 'once signed in the user is redirected to the welcome page' do
    user = FactoryBot.create(:user)
    login_as(user)
    expect(current_path).to eq '/'
  end

end
