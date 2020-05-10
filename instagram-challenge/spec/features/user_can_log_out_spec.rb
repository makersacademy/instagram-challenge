require 'rails_helper'

RSpec.feature "log out", type: :feature do 
  scenario "Users can log out " do 
    user = User.create(name: "user", email: "user@example.com", password: "12345")
    visit "sessions/new"
    fill_in 'session[email]', with: 'user@example.com'
    fill_in  'session[password]', with: '12345'
    click_on 'Sign in'
    click_on 'Sign out'
    expect(page).to not_have_content("user")
  end 
end 



