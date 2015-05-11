require 'rails_helper'

feature 'users' do 
  context "user not signed in and on the homepage" do
    it "should see a 'log in' link and a 'sign up' link" do
      visit('/')
      expect(page).to have_link('Log in')
      expect(page).to have_link('Sign Up')
    end

    it "should not see 'sign out' link" do
    visit('/')
    expect(page).not_to have_link('Sign out')
  end
  end
  context "user signed in on the homepage" do
  before do
    visit('/')
    click_link('Sign Up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
  end

  it 'should see sign out link' do
    visit('/')
    expect(page).to have_link('Sign out')
  end

  it "should not see a 'sign in' link and a 'sign up' link" do
    visit('/')
    expect(page).not_to have_link('Log in')
    expect(page).not_to have_link('Sign Up')
  end
end
  end
end