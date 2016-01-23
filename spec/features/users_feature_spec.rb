# As a user
# So that I can post pictures on Instagram
# I would like to create my own account
feature 'Users' do
  scenario 'fill out form to create an account' do
    visit '/'
    fill_in 'Name', with: 'Jessica Jones'
    fill_in 'Username', with: 'jessicajones'
    fill_in 'Email', with: 'jessica@alias.com'
    fill_in 'Password', with: 'aliaspi'
    fill_in 'Password Confirmation', with: 'aliaspi'
    click_button 'Sign up'
    expect(page).to have_content 'jessicajones'
  end
end
