require 'rails_helper'

context 'user not signed in and on the hompage' do

  it "should see a 'sign in' and a 'sign up' link" do
    visit '/'
    expect(page).to have_link 'Sign in'
    expect(page).to have_link 'Sign up'
  end

  it "should not see 'sign out' link" do
    visit '/'
    expect(page).not_to have_link 'Sign out'
  end

end

context 'user signed in on the homepage' do

  before do
    user_sign_up
  end

  it "should see 'sign out' link" do
    visit '/'
    expect(page).to have_link('Sign out')
  end

  it "should not see a 'sign in' or 'sign up' link" do
    visit '/'
    expect(page).not_to have_link 'Sign in'
    expect(page).not_to have_link 'Sign up'
  end

end