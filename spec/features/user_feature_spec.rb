require 'rails_helper'

feature "User can sign in and sign out" do
  context "user not signed in and on the homepage" do
    it "should see a 'sign-in' and 'sign-up' link" do
      visit '/'
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
    end

    it "should not see 'sign out' link" do
      visit '/'
      expect(page).not_to have_link 'Sign out'
    end
  end

  context "user signed in at homepage" do

    before { sign_up_user }

    it "should see 'Sign out' link" do
      visit '/'
      expect(page).to have_link 'Sign out'
    end

    it "should not see a 'Sign in' or 'Sign out' link" do
      visit '/'
      expect(page).not_to have_link 'Sign in'
      expect(page).not_to have_link 'Sign up'
    end
  end


  def sign_up_user
    visit '/'
    click_link 'Sign up'
    fill_in 'Email', with: 'banana@example.com'
    fill_in 'Password', with: 'banana123'
    fill_in 'Password confirmation', with: 'banana123'
    click_button 'Sign up'
  end
end
