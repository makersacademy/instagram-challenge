feature 'User can sign up, sign in and sign out' do
  scenario 'user should be able to sign up' do
    sign_up
    expect(page).to have_content "Welcome! You have signed up successfully"
  end
    scenario 'user should be able to sign out' do
      sign_up
      click_link 'Sign out'
      expect(page).to have_content "Signed out successfully."
    end
    scenario 'user should be able to sign in' do
      sign_up
      click_link "Sign out"
      sign_in
      expect(page).to have_content ""
    end
  end
