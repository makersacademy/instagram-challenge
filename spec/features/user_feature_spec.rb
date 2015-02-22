feature 'Users' do
  context 'As a new user on the homepage' do

    before(:each) { visit '/' }

    scenario 'Logged out by default' do
      expect(page).to have_link 'Sign up'
      expect(page).to have_link 'Sign in'
    end

    scenario 'Can sign up' do
      click_link 'Sign up'
      fill_in 'Email', with: 'test@test.com'
      fill_in 'Password', with: 'password1'
      fill_in 'Password confirmation', with: 'password1'
      click_button 'Sign up'

      expect(page).to have_content 'Sign out'
      expect(page).to have_content 'Welcome! You have signed up successfully'
    end

  end

end