feature 'User can sign in' do

  scenario 'from the homepage user can sign up' do
    visit '/'
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Username', with: 'test'
    fill_in 'Password', with: 'Password123'
    fill_in 'Password confirmation', with: 'Password123'
    click_button 'Sign up'
    expect(current_path).to eq '/'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end

  xscenario 'cannot signup with an existing username' do

  end
end
