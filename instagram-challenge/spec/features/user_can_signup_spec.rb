require 'rails_helper'


RSpec.feature "Sign-up", type: :feature do
  scenario "Users see heading Sign up" do 
    visit "/users/new"
    expect(page).to have_content("Sign up")
end 
  xscenario "Once user has signed up they are redirected to the home page" do 
    visit "/users/new"
    fill_in "user[name]", with: "Gina"
    click_on "Sign up"
    expect(current_path).to eql('/')
  end 
 
end 

