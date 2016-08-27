require 'rails_helper'

feature "Sign up" do
  context "after signing up" do
    before do
      visit "/"
      click_link "Sign up"
      fill_in "Email", with: "test@test"
      fill_in "Password", with: "qwerty"
      fill_in "Password confirmation", with: "qwerty"
      click_button "Sign up"
    end
    it "should display 'sign out' link" do
      expect(page).to have_link("Sign out")
    end
    xit "redirects user to pictures main page" do
      expect(current_path).to eq "/pictures"
    end
  end
end
