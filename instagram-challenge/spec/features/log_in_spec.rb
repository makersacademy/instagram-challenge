require 'rails_helper'



RSpec.feature "Sign in", type: :feature do

  scenario "user can sign in"  do 
    user = User.create(name: "user", email: "user@example.com", password: "12345")
    visit "sessions/new"
    fill_in 'user[name]', with: 'user'
    fill_in  'user[password]', with: '12345'
    click_on 'sign in'
    expect(page).to have_content('12345')
  end 
end