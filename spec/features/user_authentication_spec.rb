require 'rails_helper'

feature 'User authentication' do
  background do
    user = create(:user)
    visit '/'
  end
  scenario 'can log in from the index' do
    expect(page).to_not have_content "New Post"

    click_link 'Login'
    fill_in 'Email', with: 'mr_deadpool@marvel.com'
    fill_in 'Password', with: 'chimichanga'
    click_button 'Log in'

    expect(page).to have_content('Signed in successfully.')
    expect(page).to_not have_content('Register')
    expect(page).to have_content('Logout')
  end

  scenario 'cannot view index posts without logging in' do
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end

  scenario 'cannot create a new post without logging in' do
    visit new_post_path
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end
end
