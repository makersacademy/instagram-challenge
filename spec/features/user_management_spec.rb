require 'rails_helper'

RSpec.feature "Signup", type: :feature do
  scenario "New user can sign up" do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome! You have signed up successfully.")
    expect(User.first.email).to eq 'john@smith.com'
  end

  scenario 'matching password confirmation is required' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end

  scenario 'email matches conventions for email' do
    expect { sign_up(email: 'wrong') }.not_to change(User, :count)
  end
end

RSpec.feature "Signout", type: :feature do
  scenario "User can sign out" do
    sign_up
    click_link 'Logout'
    expect(page).to have_content("Signed out successfully.")
  end
end
