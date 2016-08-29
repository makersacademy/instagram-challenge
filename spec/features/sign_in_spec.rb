require 'rails_helper'

feature "Sign in page" do
  context "when first time on Instargam" do
    it "should display logging options" do
      visit "/users"
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
    end
    it "should not display 'sign out' link" do
      visit('/')
      expect(page).not_to have_link('Sign out')
    end
  end
end
