require 'rails_helper'
require "codeclimate-test-reporter"
CodeClimate::TestReporter.start


context "user not signed on and on the homepage" do

  # visiting '/' when not signed in should take you to the "log in" page
  
  it "should see a 'log in' link and 'sign up' link" do
    visit '/'
    expect(page).to have_button 'Log in'
    expect(page).to have_link 'Sign up'
  end

  it "should not see the 'sign out' link" do
    visit '/'
    expect(page).not_to have_link 'Sign out'
  end

end

context "user signed in on the homepage" do

  # visiting '/' when signed in should take you to the "pictures" page

  before do
    visit '/'
    click_link 'Sign up'
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button 'Sign up'
  end

  it "should see the 'sign out' link" do
    visit '/'
    expect(page).to have_link 'Sign Out'
  end

  it "should not see the 'sign up' or 'log in' link" do
    visit '/'
    expect(page).not_to have_link 'Sign up'
    expect(page).not_to have_link 'Log in'
    
  end

end