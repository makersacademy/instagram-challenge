feature 'A user can sign in and out' do

  context 'User not signed in and on the homepage' do

    scenario 'should see a sign up and sign in link' do
      visit '/'
      expect(page).to have_link 'Sign up'
      expect(page).to have_link 'Sign in'
    end

    scenario 'should not see a sign out link' do
      visit '/'
      expect(page).not_to have_link 'Sign out'
    end
  end

  context 'User signed in and on the homepage' do

    scenario 'should see a \'sign out\' link' do
      visit '/'
      click_link 'Sign up'
      fill_in 'Email', with: 'test@test.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      click_button 'Sign up'
      expect(page).to have_link 'Sign out'
    end

    scenario 'should not see \'sign in\' or \'sign up\' links ' do
      visit '/'
      click_link 'Sign up'
      fill_in 'Email', with: 'test@test.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      click_button 'Sign up'
      expect(page).not_to have_link 'Sign in'
      expect(page).not_to have_link 'Sign up'
    end

  end
end
