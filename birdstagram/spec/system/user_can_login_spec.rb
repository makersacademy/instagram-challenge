require 'rails_helper'
require_relative 'helper_methods'

RSpec.describe "User can login", type: :system do
  before do
    driven_by(:rack_test)
    sign_up
  end
  it 'allows a user to login' do
    visit '/login'
    fill_in 'session_username', with: 'rio'
    fill_in 'session_password', with: 'bells'
    click_button 'Sign In'
    expect(page).to have_content ('Hello, rio')
  end
  it "doesn't have a login or signup button if user is logged in" do
    login
    expect(page).not_to have_button 'Sign In'
    expect(page).not_to have_button 'Sign up'
  end
end
