require 'rails_helper'



RSpec.feature "Sign-up", type: :feature do
  scenario "Users see heading Sign up" do 
    visit "/users/new"
    expect(page).to have_content("Sign up")
end 
  scenario "Once user has signed up they are redirected to their user page with thier name on it" do 
    visit "/users/new"
    fill_in 'user[name]', with: 'elmo'
    fill_in 'user[email]', with: 'elmo@example.com'
    fill_in 'user[password]', with: '123456'
    click_on "Create my account"
    expect(page).to have_content('elmo')
  end 
 
end 

