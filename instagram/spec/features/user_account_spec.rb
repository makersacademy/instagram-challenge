
require "rails_helper"

RSpec.feature "User sign-up", type: :feature do

 context "when user hasn't signedup or -in" do
    scenario "they can reach a signup form" do
      visit '/'
      click_on "Sign Up"
      expect(page).to have_content("Sign up")
    end
  end

  scenario "and they can signup successfully" do
    visit '/'
    sign_up
    expect(page).to have_content("Welcome! You have signed up successfully")
  end

  # Return to write better error checks

  context "when user enters incorrect signup details" do
  scenario "they get a descriptive error flash" do
    visit '/'
    sign_up(password_confirmation: "12345")
    expect(page).to have_content("error prohibited this user from being saved")
  end
end

  context "when the user is logged in" do
  scenario "they won't see a signup or signin link" do
    visit '/'
    sign_up
    expect(page).to_not have_content("Sign Up")
    expect(page).to_not have_content("Sign In")
  end
end

   feature "User sign in", type: :feature do

     context "when user is unregistered or logged out" do
    scenario "a sign-in form can be reached" do
      visit '/'
      click_on "Sign In"
      expect(page).to have_content('Log in form')
    end
  end

    context "when user is properly registered" do

      before do
        visit '/'
        sign_up
        click_on "Sign Out"
      end

      scenario "they can log in" do
        log_in
        expect(page).to have_content("Signed in successfully")
      end

      scenario "and there email is displayed to them after" do
        log_in
        expect(page).to have_content("jking@gmail.com")
      end

      scenario "and they get a descriptive error flash on failure here" do
        log_in(email: "fail@gmail.com")
        expect(page).to have_content("Invalid Email or password")
      end
    end


  end


  feature "User sign out", type: :feature do

  context "when user is logged in" do

    before do
      visit '/'
      sign_up
    end

   scenario "a sign out link is visable" do
     expect(page).to have_content("Sign Out")
   end

   scenario "user can log out" do
     click_on "Sign Out"
     expect(page).to have_content("Sign In")
   end
 end
end


end
