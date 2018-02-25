feature 'Creating users' do
  scenario 'user can sign up at index page' do
    visit('/')
    click_link "Register"
    fill_in 'Email', with: 'lewis@gmail.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content "Welcome!"
  end

  scenario 'cant register without an email address' do
    visit('/')
    click_link 'Register'
    fill_in 'Email', with: ''
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content "Email can't be blank"
  end
end
