feature 'sign_up' do
  background do
    visit '/'
    click_link 'Register'
  end
  scenario 'User can sign up' do
    fill_in 'User name', with: 'Steve'
    fill_in 'Email', with: 'steve@bob.com'
    fill_in 'Password', with: 'secret', match: :first
    fill_in 'Password confirmation', with: 'secret'
    click_button 'Sign up'
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end

  scenario 'requires a user name to be less than 16 characters' do
  fill_in 'User name', with: 's' * 17
  fill_in 'Email', with: 'steve@bob.com'
  fill_in 'Password', with: 'secret', match: :first
  fill_in 'Password confirmation', with: 'secret'

  click_button 'Sign up'
  expect(page).to have_content("maximum is 16 characters")
end
end
