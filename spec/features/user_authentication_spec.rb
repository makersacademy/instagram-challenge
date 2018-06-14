require 'rails_helper.rb'

feature 'User authentication' do
  background do
    user = create(:user)
  end

  scenario 'user can log in' do
    visit '/'
    expect(page).to_not have_content('New Post')

    click_link 'Login'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'password1'
    click_button 'Log in'
    expect(page).to have_content('Signed in successfully.')
    expect(page).to_not have_content('Register')
    expect(page).to have_content('Log Out')
  end

  scenario 'user can log out' do
    visit '/'
    expect(page).to_not have_content('New Post')

    click_link 'Login'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'password1'
    click_button 'Log in'
    click_link 'Log Out'
    expect(page).to have_content('You need to sign in or sign up before continuing.')
    expect(page).to_not have_content('New Post')
    expect(page).to have_content('Register')
  end

  scenario 'user cannnot view index posts without logging in' do
    visit '/'
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end

  scenario 'user cannot create a new post without logging in' do
    visit new_post_path
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end

end
