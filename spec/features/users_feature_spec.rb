require 'rails_helper'

feature 'Users' do

  context 'is not registered and on the homepage' do
    it "should see links 'sign in' and 'sign up'" do
      visit '/'
      expect(page).to have_link 'Log in'
      expect(page).to have_link 'Register'
    end

    it "shouldn't see a 'sign out link'" do
      visit '/'
      expect(page).not_to have_link 'Sign out'
    end
  end

  context "is logged in and on the home page" do

    before do
      visit '/'
      click_link 'Register'
      fill_in 'Email', with: 'test@test.com'
      fill_in 'Password', with: 'testtest'
      fill_in 'Password confirmation', with: 'testtest'
      click_button 'Register'
    end

    it "should see 'sign out' link" do
      visit '/'
      expect(page).to have_link 'Log out'
    end

    it "shouldn't have 'sign in' and 'sign up' links" do
      visit '/'
      expect(page).not_to have_link 'Log in'
      expect(page).not_to have_link 'Register'
    end
  end

end
