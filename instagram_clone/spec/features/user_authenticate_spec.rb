require 'rails_helper'

feature 'User authentication' do
  context 'user not signed in and on the homepage' do
    scenario 'should be able to see sign in and sign out link' do
      visit '/'
      expect(page).to have_link 'Register'
      expect(page).to have_link 'Login'
    end

    scenario 'should not be able to see sign out link' do
      visit '/'
      expect(page).not_to have_link 'Logout'
    end
  end

  scenario 'can sign in via dynamic navbar' do
    sign_up
    click_link 'Logout'
    sign_in
    expect(page).to have_content('Signed in successfully')
    expect(page).to_not have_content('Register')
    expect(page).to have_content('Logout')
  end

  scenario 'can log out once logged in' do
    sign_up
    click_link 'Logout'
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end
end
