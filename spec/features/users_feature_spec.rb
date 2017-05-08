require 'rails_helper'

feature 'User can sign in and out' do
  context 'user not signed in and on the homepage' do
    it "should see a 'sign in' link and a 'sign up' link" do
      visit '/'
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
    end

    it "should see 'sign out' link" do
      visit '/'
      expect(page).not_to have_link('Sign out')
    end
  end

  context 'user signed in on the homepage' do
    before do
      sign_up
    end

    it "should see 'sign out' link" do
      visit '/'
      expect(page).to have_link('Sign out')
    end

    it "should not see a 'sign in' link and a 'sign up' link" do
      visit '/'
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end
  end
end

feature 'User limits' do
  context "Users can only edit/delete pictures which they've created" do
    before do
      sign_up
      click_link 'Sign out'
      sign_up(email: 'cat@cat.com')
      click_link 'Sign out'
    end

    it 'should only be able to edit their own picture' do
      visit root_path
      login
      create_picture(name: 'My favourite car')
      sign_out
      login(email: 'cat@cat.com')
      expect(page).not_to have_link 'Edit My favourite car'
    end
  end
end
