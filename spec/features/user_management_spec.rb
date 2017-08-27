require 'rails_helper'

RSpec.feature "Signup", type: :feature do
  scenario "New user can sign up" do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome! You have signed up successfully.")
    expect(User.first.email).to eq 'john@smith.com'
  end
end
