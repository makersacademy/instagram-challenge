feature 'Authentication' do
  before do
    visit '/'
    click_link 'Sign up'
    fill_in "Email", with: "test@test.com"
    fill_in "Username", with: "test12"
    fill_in "Password", with: "1234abcd"
    fill_in "user[password_confirmation]", with: "1234abcd"
    click_button "Sign up"
  end

  scenario 'User can sign-up' do
    expect(page).to have_link 'Sign out'
  end
end
