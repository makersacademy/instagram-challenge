require 'rails_helper'
feature "User can sign in, sign out and sign up" do
  context 'User not signed in and is on the homepage' do
    it 'user should see a sign in and sign up link'do
    visit('/')
    expect(page).to have_link('Sign in')
    expect(page).to have_link('Sign in')
  end
  it'Should not see the sign out link' do
    visit('/')
    expect(page).not_to have_content('Sign out')
  end
end

context'User signed in and on homepage' do
  it'should see sign out link' do
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: 'test@test.com')
    fill_in('Password', with: 'test1234')
    fill_in('Password confirmation', with: 'test1234')
    click_button('Sign up')
    expect(page).to have_link('Sign out')
  end
end
end
