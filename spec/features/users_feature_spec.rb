require 'rails_helper'

feature 'users' do
  context 'user not signed in and on the home page' do
    scenario "should see a 'Sign in' link and a 'Sign-up' link" do
      visit '/'
      expect(page).to have_link 'Sign in'
      expect(page).to have_link 'Sign up'
    end

    scenario "should not see 'Sign out' link" do
      visit '/'
      expect(page).not_to have_link 'Sign out'
    end
  end

  context 'user signed in on the home page' do
    before do
       sign_up
    end

    scenario "should see 'Sign out' link" do
      visit '/'
      expect(page).to have_link 'Sign out'
    end

    scenario "should not see a 'Sign in' link or a 'Sign up' link" do
      visit '/'
      expect(page).not_to have_link 'Sign in'
      expect(page).not_to have_link 'Sign up'
    end
  end

  context 'user validations at sign up' do
    scenario 'should not be able to sign up with an existing username' do
      sign_up
      click_link 'Sign out'
      click_link 'Sign up'
      expect {sign_up(email:'emmpak@makers.com') }.not_to change {User.count}
    end
  end
end
