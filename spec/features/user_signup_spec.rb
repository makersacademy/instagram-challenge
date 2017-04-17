feature 'User signup' do
  context 'when not signed in' do

    it 'should see sign up and sign in link' do
      visit root_path

      expect(page).to have_content 'Sign in'
      expect(page).to have_content 'Sign up'
    end

    it 'a user can sign up' do
      visit root_path
      click_link('Sign up')

      user = build(:user)
      sign_up_as(user)

      expect(page).to have_content "Welcome! You have signed up successfully."
    end
  end

  context 'when signed in' do

    it 'should not see sign up and sign in links' do
      visit root_path

      user = build(:user)
      sign_up_as(user)

      expect(page).not_to have_content 'Sign in'
      expect(page).not_to have_content 'Sign up'
    end
  end
end

def sign_up_as user
  visit root_path
  click_link 'Sign up'
  fill_in 'Email', with: user.email
  fill_in 'Password', with: user.password
  fill_in 'Password confirmation', with: user.password_confirmation
  click_button 'Sign up'
end
