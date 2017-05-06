require 'rails_helper'

feature 'user can sign in and out' do
  context 'user not signed in and on the home page' do
    it "should see a 'Sign in' link and a 'Sign-up' link" do
      visit '/'
      expect(page).to have_link 'Sign in'
      expect(page).to have_link 'Sign up'
    end

    it "should not see 'Sign out' link" do
      visit '/'
      expect(page).not_to have_link 'Sign out'
    end
  end

  context 'user signed in on the home page' do
    before do
       sign_up
    end

    it "should see 'Sign out' link" do
      visit '/'
      expect(page).to have_link 'Sign out'
    end

    it "should not see a 'Sign in' link or a 'Sign up' link" do
      visit '/'
      expect(page).not_to have_link 'Sign in'
      expect(page).not_to have_link 'Sign up'
    end
  end
end
