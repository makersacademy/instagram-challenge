require 'rails_helper'

feature "User can sign in and out" do
  context "user not signed in and on homepage" do
    it "should see 'sign in' and 'sign up' links" do
      visit '/'
      expect(page).to have_link('Sign up')
      expect(page).to have_link('Sign in')
    end
  end


end
