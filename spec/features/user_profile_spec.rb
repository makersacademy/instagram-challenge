require 'rails_helper'

  RSpec.feature "Profile Page", type: :feature do
    scenario "User has a profile page" do
      sign_up
      click_link 'Profile'
      expect(page).to have_content('Hello, Fred Test')
    end
  end
