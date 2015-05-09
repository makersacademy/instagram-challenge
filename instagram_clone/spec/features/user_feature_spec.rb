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
  scenario "" do
  end
end