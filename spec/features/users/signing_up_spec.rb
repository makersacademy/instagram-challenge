require 'rails_helper'

feature "User signing up" do

  context "username is taken"
    before do
      visit('/')
      click_link('Register')
      fill_in('Email', with: 'test@example.com')
      fill_in('Username', with: 'test1234')
      fill_in('user_password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button('Sign up')
    end
  scenario 'username must be unique' do
    visit('/')
    click_link('Sign out')
    click_link('Register')
    fill_in('Email', with: 'test@example.com')
    fill_in('Username', with: 'test1234')
    fill_in('user_password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
    expect(page).to have_content "Usernamehas already been taken"
  end
end
