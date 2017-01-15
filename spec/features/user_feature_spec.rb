require 'rails_helper'

  feature "user" do
    context "User can sign in and out" do
      scenario "I want to see a link to the sign in or sign up on the home page" do
        visit("/")

        expect(page).to have_link("Sign in")
        expect(page).to have_link("Sign up")
        expect(page).not_to have_link("Sign out")
      end

      scenario "I want a link to sign out when I am signed in" do
        sign_up
        visit("/")

        expect(page).to have_link("Sign out")
        expect(page).not_to have_link("Sign up")
        expect(page).not_to have_link("Sign in")
      end
      
  end
end
