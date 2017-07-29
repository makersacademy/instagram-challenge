
require "rails_helper"

RSpec.feature "User sign up", type: :feature do

 context "when user not signup or -in" do
    scenario "User can access signup form" do
      visit '/'
      click_on "Sign Up"
      expect(page).to have_content("Sign up form")
    end
  end

  context "when user not signup or -in" do
  scenario "User can signup successfully" do
    visit '/'
    sign_up
    expect(page).to have_content("Welcome! You have signed up successfully")
  end
  end

  # return to provide more comp error checks

  scenario "User receives error flash on failed sign up" do
    visit '/'
    sign_up(password_confirmation: "12345")
    expect(page).to have_content("error prohibited this user from being saved")
  end

  context "when already logged in" do

  scenario "User should not see signup or -in on home page" do
    visit '/'
    sign_up
    expect(page).to_not have_content("Sign Up")
    expect(page).to_not have_content("Sign In")
  end

end

   feature "User sign in", type: :feature do

    scenario "Sign in form is accessible" do
      visit '/'
      click_on "Sign In"
      expect(page).to have_content('Log in form')
    end

    context "when user has an account" do
      scenario "they can log in successfully" do
        visit '/'
        sign_up
        click_on "Sign Out"
        log_in
        expect(page).to have_content("Signed in successfully")
      end

      scenario "user will receive errors on failed sign_in" do
        visit '/'
        sign_up
        click_on "Sign Out"
        log_in(email: "fail@gmail.com")
        expect(page).to have_content("Invalid Email or password")
      end


    end


  end


  feature "User sign out", type: :feature do

  context "when user is logged in" do

   scenario "sign out is visable" do
     visit '/'
     sign_up
     expect(page).to have_content("Sign Out")
   end

   scenario "user can log out" do
     visit '/'
     sign_up
     click_on "Sign Out"
     expect(page).to have_content("Sign In")
   end
 end
end


end
