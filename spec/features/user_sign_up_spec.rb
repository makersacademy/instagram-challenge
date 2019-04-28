feature 'User can sign up' do
  scenario 'User enters unique username, email and a password and is redirected to posts page with success message' do
    visit '/users/new'
    fill_in 'user_username', with: 'Andy'
    fill_in 'user_email', with: 'andy@testemail.com'
    fill_in 'user_password', with: '123456'
    fill_in 'user_password_confirmation', with: '123456'
    click_button 'Sign Up'
    expect(page).to have_content "Congratulations Gran, you're all signed up!"
  end

  scenario 'User enters invalid sign up details and is redirected to index with warning message' do
    visit '/users/new'
    fill_in 'user_username', with: 'Andy'
    fill_in 'user_email', with: 'andytestemail.com'
    fill_in 'user_password', with: '123456'
    fill_in 'user_password_confirmation', with: '123456'
    click_button 'Sign Up'
    expect(page).to have_content "Something wasn't right, try again!"
  end
end
