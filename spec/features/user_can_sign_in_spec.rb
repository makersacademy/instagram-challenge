feature 'User can sign in' do
  scenario 'User enters email and password and is redirected to posts page' do
    visit '/users/new'
    fill_in 'user_username', with: 'Andy'
    fill_in 'user_email', with: 'andy@testemail.com'
    fill_in 'user_password', with: '123456'
    fill_in 'user_password_confirmation', with: '123456'
    click_button 'Sign Up'
    expect(page).to have_content "Congratulations Gran, you're all signed up!"
  end
end
