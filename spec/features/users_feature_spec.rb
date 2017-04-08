feature 'Users' do
  context 'Users can sign up to Instagram' do
    scenario 'Users can sign up to Instagram with their email addresses' do
      visit '/'
      click_link 'Sign Up'
      fill_in :user_username, with: 'test1'
      fill_in :user_email, with: 'test@example.com'
      fill_in :user_password, with: 'password123'
      fill_in :user_password_confirmation, with: 'password123'
      click_button 'Sign up'
      expect(page).to have_content 'test1'
      expect(page).not_to have_content 'Sign Up'
    end
  end

  context 'Users must provide the correct information' do

    before(:each) do
      visit '/'
      user_sign_up
      click_link 'Sign Out'
      click_link 'Sign Up'
    end

    scenario 'Passwords must be longer than 6 characters' do
      fill_in :user_username, with: 'test2'
      fill_in :user_email, with: 'test2@example.com'
      fill_in :user_password, with: 'pass'
      fill_in :user_password_confirmation, with: 'pass'
      click_button 'Sign up'
      expect(page).to have_content 'Password is too short (minimum is 6 characters)'
      expect(page).not_to have_content 'test1'
    end

    scenario 'Users cannot use an email which has already been taken' do
      fill_in :user_username, with: 'test2'
      fill_in :user_email, with: 'test@example.com'
      fill_in :user_password, with: '123password'
      fill_in :user_password_confirmation, with: '123password'
      click_button 'Sign up'
      expect(page).to have_content 'Email has already been taken'
      expect(page).not_to have_content 'test2'
    end

    scenario 'Users cannot use a username which has already been taken' do
      fill_in :user_username, with: 'test1'
      fill_in :user_email, with: 'test2@example.com'
      fill_in :user_password, with: '123password'
      fill_in :user_password_confirmation, with: '123password'
      click_button 'Sign up'
      expect(page).to have_content 'Username has already been taken'
      expect(page).not_to have_content 'test1'
    end
  end
end
