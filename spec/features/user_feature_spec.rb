require 'rails_helper'

feature 'A new user arrives on the homepage' do
  scenario 'and wants to sign up' do
    visit '/'
    expect(page).to have_content 'Please sign in'
    sign_up('test@test.com')
    expect(page).to have_content 'Welcome to Instagram test@test.com'
    expect(User.count).to eq 1
  end
  scenario 'and wants to sign out' do
    sign_up('test@test.com')
    click_link 'Sign out'
    expect(page).to have_content 'Please sign in'
  end
  scenario 'and wants to sign in again' do
    sign_up('test@test.com')
    click_link 'Sign out'
    sign_in('test@test.com')
    expect(page).to have_content 'Welcome back test@test.com'

  end
end

