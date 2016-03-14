require "rails_helper"

RSpec.feature "Hipster can sign in and out" do

  context "When user is not signed in and is on the homepage" do
    it "Should offer a sign in and sign up link to the user" do 
      visit "/"
      expect(page).to have_content "Sign up"
      expect(page).to have_content "Log in"

    end
  end



end
