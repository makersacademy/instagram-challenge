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

    scenario 'should see an error when trying to register with an existing username' do
      sign_up
      click_link 'Sign out'
      click_link 'Sign up'
      sign_up
      expect(page).to have_content 'Username has already been taken'
      expect(page).to have_content 'Email has already been taken'
      expect(current_path).to eq '/users'
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
end
