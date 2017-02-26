require 'rails_helper'

feature 'Authenticating user works' do
  background do
    user = create(:user)
  end

  scenario 'by logging in' do
    visit '/'
    expect(page).to_not have_content('New Post')

    click_link 'Login'
    fill_in 'Email', with: 'johndoe@internet.com'
    fill_in 'Password', with: 'testtest'
    click_button 'Log in'
    expect(page).to have_content('Signed in successfully.')
    expect(page).to_not have_content('Register')
    expect(page).to have_content('Logout')
  end

  scenario 'and logging out from navbar' do
    visit '/'
    click_link 'Login'
    fill_in 'Email', with: 'johndoe@internet.com'
    fill_in 'Password', with: 'testtest'
    click_button 'Log in'
    click_link 'Logout'
    expect(page).to have_content('Signed out successfully.')
  end
end
