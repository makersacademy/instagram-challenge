require 'rails_helper'
require 'helpers/web_helper'

feature 'User functionality' do

  scenario 'User can sign up' do
    sign_up
    expect(page).to have_content "Welcome! You have signed up successfully."
    expect(User.first.user_name).to eq "kennbarr"
  end

  scenario 'User can sign out' do
    sign_up
    expect(page).to have_content "Welcome! You have signed up successfully."
    expect(User.first.user_name).to eq "kennbarr"
  end

  scenario 'User can sign in' do
    sign_up
    expect(page).to have_content "Welcome! You have signed up successfully."
    expect(User.first.user_name).to eq "kennbarr"
  end

end
