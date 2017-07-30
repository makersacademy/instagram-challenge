require 'rails_helper'

feature 'user logs in' do
  before do
    visit "/"
    click_link "Sign up"
    sign_up
    click_link "Log out"
    click_link "Log in"
  end

  scenario 'with valid details' do
    expect(current_path).to eq(new_user_session_path)
    log_in
    expect(current_path).to eq("/users/1")
  end

end
