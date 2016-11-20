require 'rails_helper'

feature 'User authentication' do
  background do
    create(:user, username: "Laurent", email: 'laurent@makers.com', password: 'password')
  end
  scenario 'can sign in' do
    visit '/'
    expect(page).to_not have_content('New Post')

    click_link 'Login'
    fill_in 'Email', with: 'laurent@makers.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'

    expect(page).to have_content('Signed in successfully.')
    expect(page).to_not have_content('Register')
    expect(page).to have_content('Logout')
  end
end
