require 'rails_helper'



RSpec.feature "Sign-up", type: :feature do
  scenario "Users see heading Sign up" do 
    visit "/users/new"
    expect(page).to have_content("Sign up")
end 
  scenario "Once user has signed up they are redirected to a page with thier name on it" do 
    user_1 = User.create(name: "elmo", email: "emmo@example.com", password: "abcdef")
    visit "/users/new"
    expect(page).to have_content('elmo')
  end 
 
end 

