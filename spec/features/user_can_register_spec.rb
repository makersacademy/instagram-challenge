require 'rails_helper'

feature 'User registration' do
  scenario 'a user can register' do
    visit '/'

    click_link 'Create account'

    expect(current_path).to eq '/users/new'
    expect(page).to have_content 'Create account'

    fill_in "user[full_name]", with: 'Marius Brad'
    fill_in "user[username]", with: 'mbrad26'
    fill_in "user[email]", with: 'email@example.com'
    fill_in "user[password]", with: 'password'
    fill_in "user[password_confirmation]", with: 'password'
    click_button 'Register'

    expect(current_path).to eq '/sessions/new'
    expect(page).to have_content 'Account created successfully'
  end
end
