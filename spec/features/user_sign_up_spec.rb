require 'rails_helper'
RSpec.feature "User", type: :feature do
  scenario "Can sign up" do
    visit "/signup"
    fill_in "user_email", with: "rodriguekayemebe@gmail.com"
    fill_in "user_password", with: "pASSword1"
    fill_in "user_password_confirmation", with: "pASSword1"
    click_button "Sign up"
    expect(page).to have_content("Home#index")
  end
  
  before do 
    User.create!({:email => "guy@gmail.com",:password => "Testing12", :password_confirmation => "Testing12" })
  end
    scenario "Can log in" do
      visit "/login"
      fill_in "user_email", with: "guy@gmail.com"
      fill_in "user_password", with: "Testing12"
      click_button "Log in"
      expect(page).to have_content("Home#index")
    end

end

