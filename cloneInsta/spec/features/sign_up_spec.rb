feature 'Sign up' do
  scenario 'user can sign up'
    visit '/users/sign_in'
    click_link 'Sign up'
    fill_in 'user[email]', with: 'monroe@example.com'
    fill_in 'user[password]', with: 'example'
    fill_in 'user[password_confirmation]', with: 'example'
    click_button 'Sign up'
    expect(page).to have_content 'You have signed in.'
end
