require 'rails_helper'

feature 'User authentication' do
  background do
    user = create(:user)
  end

  scenario 'can log in from the index' do
    visit '/'
    expect(page).to_not have_content('New Post')

    click_link 'Login'
    fill_in 'Email', with: 'johndoe@hotmail.com'
    fill_in 'Password', with: 'john1900'
    click_button 'Log in'

    expect(page).to have_content('Signed in successfully.')
    expect(page).to_not have_content('Register')
    expect(page).to have_content('Logout')
  end

  scenario 'can log out after having logged in' do
    visit '/'
    click_link 'Login'
    fill_in 'Email', with: 'johndoe@hotmail.com'
    fill_in 'Password', with: 'john1900'
    click_button 'Log in'

    click_link 'Logout'
    expect(page).to have_content('Signed out successfully')
  end

end
