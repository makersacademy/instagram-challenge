feature 'User Logout' do
  scenario 'user can logout' do
    visit 'users/sign_up'
    fill_in "user[email]", :with => "user@test.com"
    fill_in 'user[password]' ,:with => "password"
    fill_in "user[password_confirmation]", :with => "password"
    click_button "Sign up"
    click_link 'Log out'
    expect(page).to have_current_path('/')
    expect(page).to have_content('Signed out successfully.')
  end
end
