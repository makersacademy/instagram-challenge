require 'rails_helper'

feature "User can sign in and out" do
  context "user not signed in and on the homepage" do
    scenario "should see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
    end

    scenario "should not see 'sign out' link" do
      visit('/')
      expect(page).not_to have_link('Sign out')
    end

  end


  context "user signed in on the homepage" do
    before do
      visit('/')
      sign_up
      sign_out
      sign_in
    end

    scenario "should see 'sign out' link" do
      visit('/')
      expect(page).to have_link('Sign out')
    end

    scenario "should not see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end
  end
end


feature "User authentication" do
  before do
    Picture.create(name:'My picture', description: 'This is a fantastic pic')
  end
  context 'user not signed in' do
    scenario 'can visit index page' do
      visit('/')
      expect(page).to have_link('Sign in')
    end
    scenario 'can visit show picture page' do
      visit('/')
      click_link('My picture')
      expect(page).to have_link('Sign in')
      expect(page).to have_content('My picture')
    end
    scenario 'can not visit any other pages' do
      visit('/')
      click_link('Edit My picture')
      expect(page).to have_content('Log in')

    end
  end

end
