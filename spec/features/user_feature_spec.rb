require 'rails_helper'

feature "User can login and out" do
  context "user not signed in and on the homepage" do
    it "should see a 'Login' link and a 'Sign Up' link" do
      visit('/')
      expect(page).to have_link('Login')
      expect(page).to have_link('Sign Up')
    end
  end

  context "user signed in on the homepage" do
    let!(:user){User.create(email: 'dan@example.com',
                            password: 'Hell0World!')}

    before do
      login(user)
    end

    it "should see 'Sign Out' link" do
      visit('/')
      expect(page).to have_link('Sign out')
    end

    it "should not see a 'Login' link and a 'Sign Up' link" do
      visit('/')
      expect(page).not_to have_link('Login')
      expect(page).not_to have_link('Sign Up')
    end
  end
end
