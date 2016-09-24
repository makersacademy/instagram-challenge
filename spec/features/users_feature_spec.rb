feature 'User can sign in' do

  scenario 'from the homepage user can sign up' do
    sign_up
    expect(current_path).to eq '/'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end

  scenario 'cannot signup with an existing username' do
    sign_up
    click_link 'Sign out'
    sign_up(email: 'different@example.com')
    expect(page).to have_content 'Username has already been taken'
  end

  scenario 'cannot signup with an existing email' do
    sign_up
    click_link 'Sign out'
    sign_up(username: 'test2')
    expect(page).to have_content 'Email has already been taken'
  end

  context 'when signed in' do
    before { sign_up }

    scenario 'from the homepage a signed in user can sign out' do
      click_link 'Sign out'
      expect(page).to have_content 'Signed out successfully'
    end

    scenario 'cannot see sign up page on homepage' do
      expect(page).not_to have_xpath '//*[@id="new_user"]'
    end

    scenario 'cannot see signup or login link' do
      expect(page).not_to have_link 'Sign up'
      expect(page).not_to have_link 'Log in'
    end
  end

  context 'when not signed in' do

    scenario 'can login' do
      sign_up
      click_link 'Sign out'
      within '//div[@class="navigation"]' do
        click_link 'Log in'
      end
      fill_in 'Username', with: 'test'
      fill_in 'Password', with: 'Password123'
      click_button 'Log in'
      expect(page).to have_content 'Signed in successfully'
    end

  end

end
