require 'rails_helper'

feature 'User Features ' do

  context 'when visiting the home page' do

    scenario 'can see a sign up link' do
      visit root_path
      expect(page).to have_link "Sign up"
    end

    scenario 'user can sign up' do
    user = build(:user)
    sign_up(user)
    expect(page).to have_content "Welcome! You have signed up successfully."
    end

  end
end