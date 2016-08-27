require 'rails_helper'

feature 'A user can sign in and out' do

  context 'user is not signed in and on the homepage' do

    it 'should see a sign in link and a sign up link' do
      visit '/'
      expect(page).to have_link 'Sign In'
      expect(page).to have_link 'Sign Up'
    end

    it 'should not see a sign out link' do
      visit '/'
      expect(page).not_to have_link 'Sign Out'
    end

  end

  context 'user signed in and on the homepage' do

    before do
      visit '/'
      click_link 'Sign Up'
      fill_in 'Email', with: 'demo@domain.com'
      fill_in 'Password', with: '1234567'
      fill_in 'Password confirmation', with: '1234567'
      click_button 'Sign Up'
    end

    it "should see 'sign out' link" do
      visit('/')
      expect(page).to have_link('Sign Out')
    end

    it "should not see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).not_to have_link('Sign In')
      expect(page).not_to have_link('Sign Up')
    end
    
  end

end
