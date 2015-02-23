require 'rails_helper'

context 'user not signed in and on the homepage' do
  scenario "user should see a 'sign in' link and a 'sign up' link" do
    visit '/'
    expect(page).to have_link('Sign in')
    expect(page).to have_link('Sign up')
  end

  scenario "user should not see a 'Sign out' link" do
    visit '/'
    expect(page).not_to have_link('Sign out')
  end
end

context 'user signed in on the homepage' do

  before do
    visit '/'
    click_link 'Sign up'
    fill_in('Email', with: 'matt@me.com')
    fill_in('Password', with: 'fourfour')
    fill_in('Password confirmation', with: 'fourfour')
    click_button 'Sign up'
  end

  scenario "user should see a 'Sign out' link" do
    visit '/'
    expect(page).to have_link 'Sign out'
  end

  scenario "user should not see a 'Sign in' link and a 'Sign up' link" do
    visit '/'
    expect(page).not_to have_link 'Sign in'
    expect(page).not_to have_link 'Sign up'
  end

end