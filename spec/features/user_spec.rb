RSpec.feature 'User' do

  it 'allows user to sign up' do
    sign_up
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end

  it 'redirects to a users profile' do
    sign_up
    expect(current_path).to eq('/')
    expect(page).to have_content "Alice's Profile"
  end

  it 'displays another homepage for unauthenticated visitors' do
    sign_up
    click_button 'Logout'
    expect(current_path).to eq('/')
    expect(page).not_to have_content "Alice's profile"
  end

  describe 'log out button' do
    it 'allows signed-in user to sign out' do
      sign_up
      click_button 'Logout'
      expect(page).to have_content 'Signed out successfully.'
    end
  end

end
