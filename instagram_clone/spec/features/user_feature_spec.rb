require 'rails_helper'

context "user not signed in and on the homepage" do
  scenario "user should see a link to sign up" do
    visit('/')
    expect(page).to have_link('Sign up')
  end
  scenario "user should see link to sign in" do
    visit('/')
    expect(page).to have_link('Sign in')
  end
end

context "user is signed in and on the homepage" do
  before(:each) do
    sign_up
  end
  scenario "they should see sign out link" do
    visit('/')
    expect(page).to have_link('Sign out')
  end

  scenario "they should not see a sign in link or a sign up link" do
    visit('/')
    expect(page).not_to have_link('Sign in')
    expect(page).not_to have_link('Sign up')
  end
end