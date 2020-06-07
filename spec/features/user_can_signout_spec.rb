require 'rails_helper'

feature 'User sign out' do
  scenario 'a user can sign out' do
    user = User.create(full_name: 'Marius Brad', username: 'mbrad26', email: 'email@example.com', password: 'password')

    visit '/sessions/new'

    fill_in :email, with: 'email@example.com'
    fill_in :password, with: 'password'
    click_button 'Sign In'

    expect(current_path).to eq '/pictures'
    expect(page).to have_link 'Sign Out'

    click_link 'Sign Out'

    expect(current_path).to eq '/'
    expect(page).to have_content 'See you next time'
  end
end
