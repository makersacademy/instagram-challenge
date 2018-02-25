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

  scenario 'cant register without a password' do
    visit('/')
    click_link 'Register'
    fill_in 'Email', with: 'lewis@gmail.confirmation'
    fill_in 'Password', with: ''
    fill_in 'Password confirmation', with: ''
    click_button 'Sign up'
    expect(page).to have_content "Password can't be blank"
  end
  scenario 'password must be more than 6 characters' do
    visit('/')
    click_link 'Register'
    fill_in 'Email', with: 'lewis@gmail.confirmation'
    fill_in 'Password', with: 'test1'
    fill_in 'Password confirmation', with: 'test1'
    click_button 'Sign up'
    expect(page).to have_content "Password is too short"
  end
  scenario 'password confirmation must match' do
    visit('/')
    click_link 'Register'
    fill_in 'Email', with: 'lewis@gmail.confirmation'
    fill_in 'Password', with: 'testing1'
    fill_in 'Password confirmation', with: 'testing2'
    click_button 'Sign up'
    expect(page).to have_content "Password confirmation doesn't match"
  end
end
