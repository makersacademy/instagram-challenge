RSpec.feature 'Registration', type: :feature do
    scenario 'Users can sign up on the sign up page' do
      visit '/sign_up'
      fill_in 'user[email]', with: 'joebloggs@test.com'
      fill_in 'user[password]', with: 'bad_password_123'
      fill_in 'user[password_confirmation]', with: 'bad_password_123'
      click_button 'Sign up'
      expect(page).to have_content('Posts')
    end
  end
  