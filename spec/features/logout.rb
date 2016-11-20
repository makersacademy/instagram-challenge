scenario 'can log out once signed in' do
    visit '/'
    click_link 'Login'
    fill_in 'Email', with: 'laurent@makers.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'

    click_link 'Logout'
    expect(page).to have_content('Signed out successfully.')
  end
