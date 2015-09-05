require "rails_helper"

feature "home" do
  before { visit "/" }
  context "user sees appropriate buttons," do
    context "when not signed in" do
      it "should see sign in and up links on home page" do
        expect(page).to have_link("Sign in")
        expect(page).to have_link("Sign up")
      end
      it "shouldn't see sign out link on home page" do
        expect(page).not_to have_link("Sign out")
      end
    end
    context "when signed in" do
      before do
        click_link "Sign up"
        fill_in "Email", with: "Test@email.co.uk"
        fill_in "Password", with: "testtest"
        fill_in "Password confirmation", with: "testtest"
        click_button "Sign up"
      end
      it "should see sign out link on home page" do
        expect(page).to have_link("Sign out")
      end
      it "shouldn't see sign up and in links on home page" do
        expect(page).not_to have_link("Sign in")
        expect(page).not_to have_link("Sign up")
      end
    end
  end
end