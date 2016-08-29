require "rails_helper"

feature "A user can sign in and out" do
  context "User isn't signed in on the homepage" do
    it "should see the sign in and sign up links" do
      visit '/'
      expect(page).to have_link("Sign in")
      expect(page).to have_link("Sign up")
    end

    it "Should not see a sign out link" do
      visit '/'
      expect(page).not_to have_link("Sign out")
    end
  end

  context "user signed in on the homepage" do
    before do
      sign_up
    end

    it "should see 'sign out' link" do
      visit('/')
      expect(page).to have_link('Sign out')
    end

    it "should not see a sign in or sign up link" do
      visit('/')
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end
  end
end
