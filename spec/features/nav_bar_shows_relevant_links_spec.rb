require "rails_helper"

RSpec.feature "NavBar", type: :feature do 
  
  describe "when not logged in" do

    scenario "shows the log in button" do
      visit "/"
      expect(page).to have_content("Login")
    end
    
    scenario "shows the sign up button" do
      visit "/"
      expect(page).to have_content("SignUp")
    end

  end

  describe "when logged in" do

    before(:each) do
      visit "/"
      click_link "SignUp"

      fill_in "Email", with: "test@email.com"
      fill_in "Password", with: "123456"
      fill_in "Password confirmation", with: "123456"
      click_button "Sign up"
    end

    scenario "doesn't show the log in button" do
      expect(page).not_to have_content("Login")
    end
    
    scenario "doesn't show the log in button" do
      expect(page).not_to have_content("SignUp")
    end
  end
end