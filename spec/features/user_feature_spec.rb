require 'rails_helper'

feature 'users' do
  before :each do
    sign_up
  end

  scenario 'can register' do
    expect(page).to have_content "Welcome"
    expect(current_path).to eq(root_path)
  end

  scenario 'can sign in' do
    sign_in
    expect(page).to have_content "Signed in successfully"
    expect(current_path).to eq(root_path)
  end



  def sign_up
    visit '/'
    click_link 'Register'
    fill_in "Email", with: "test@test.com"
    fill_in "User name", with: "miamigo"
    fill_in "Password", with: "bananas"
    fill_in "Password confirmation", with: "bananas"
    click_button "Sign up"
  end

  def sign_in
    click_link 'Sign out'
    click_link 'Login'
    fill_in "Email", with: "test@test.com"
    fill_in "Password", with: "bananas"
    click_button "Log in"
  end
end
