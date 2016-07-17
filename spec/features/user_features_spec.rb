require 'rails_helper'
require 'spec_helper'

feature "user sign in and out of accounts" do

  before  do
    User.create(:email => 'jimbo@example.com', :password => 'password')
  end

scenario "sign in" do
    sign_in
    expect(page).to have_content 'Welcome jimbo@example.com!'
end

scenario "sign out" do
    visit '/'
    sign_in
    click_link 'Sign out'
    expect(page).to have_link 'Sign in'
  end
end

feature "user signs up" do
  scenario "sign up" do
      visit '/'
      sign_up
      expect(page).to have_content 'Welcome jimbo@example.com!'
    end
end
