require 'rails_helper'

def sign_up(
            user_name: '@Barney',
            first_name: 'Barney',
            last_name: 'Test',
            email: 'barney@barney.com',
            password: '456789',
            password_confirmation: '456789')
  visit '/users/sign_up'
  fill_in 'user_user_name', with: user_name
  fill_in 'user_first_name', with: first_name
  fill_in 'user_last_name', with: last_name
  fill_in 'user_email' , with: email
  fill_in 'user_password', with: password
  fill_in 'user_password_confirmation', with: password_confirmation
  click_button 'Sign up'
end

def sign_in(email: 'barney@barney.com',
            password: '456789')
  visit '/users/sign_in'
  fill_in "user_email", with: email
  fill_in "user_password", with: password
  click_button 'Log in'
end

RSpec.feature "Signup", type: :feature do
  scenario "New user can sign up" do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome! You have signed up successfully.")
    expect(User.first.email).to eq 'barney@barney.com'
  end

  scenario 'matching password confirmation is required' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end

  scenario 'email matches conventions for email' do
    expect { sign_up(email: 'wrong') }.not_to change(User, :count)
  end
end

RSpec.feature "Signin", type: :feature do
  scenario "User can sign in" do
    sign_up
    click_link "Logout"
    sign_in
    expect(page).to have_content("Signed in successfully.")
  end
end

RSpec.feature "Signout", type: :feature do
  scenario "User can sign out" do
    sign_up
    click_link 'Logout'
    expect(page).to have_content("Login You need to sign in or sign up before continuing.")
  end
end

RSpec.feature "Edit", type: :feature do
  scenario "User can edit details about her/himself" do
    sign_up
    click_link 'Account'
    fill_in 'user_first_name', with: 'Test'
    fill_in 'user_current_password', with: '456789'
    click_button 'Update'
    expect(page).to have_content("Your account has been updated successfully.")
  end
end
