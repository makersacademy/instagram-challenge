require 'rails_helper'

feature 'User registration' do
  scenario 'a user can register' do
    visit '/'

    click_link 'Create account'

    expect(current_path).to eq '/users/new'
    expect(page).to have_content 'Create account'

    fill_in :full_name, with: 'Marius Brad'
    fill_in :username, with: 'mbrad26'
    fill_in :email, with: 'email@example.com'
    fill_in :password, with: 'password'
    fill_in :password_confirmation, with: 'password'
    click_button 'Register'

    expect(current_path).to eq '/session/new'
    expect(page).to have_content 'Account created successfully'
  end
end
