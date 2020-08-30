require 'rails_helper'

feature 'User sign in' do
  scenario 'a user can click on a sign in link' do
    user = User.create(full_name: 'Marius Brad', username: 'mbrad26', email: 'email@example.com', password: 'password')

    visit '/'

    click_link 'Sign In'

    expect(current_path).to eq '/sessions/new'
    expect(page).to have_content 'Sign In'

    fill_in :email, with: 'email@example.com'
    fill_in :password, with: 'password'
    click_button 'Sign In'

    expect(current_path).to eq '/pictures'
    expect(page).to have_content `Welcome #{user.full_name}`
  end
end
