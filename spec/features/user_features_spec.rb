feature 'user management' do
  scenario 'prompt user to sign in when no users signed in' do
    visit root_path
    expect(page).to have_content 'Sign in'
  end

  scenario 'prompt user to sign up when no users signed in' do
    visit root_path
    expect(page).to have_content 'Sign up'
  end

  scenario 'user signed in will see sign out button' do
    user = create :user
    sign_in(user)
    visit root_path
    expect(page).to have_content 'Sign out'
  end
end
