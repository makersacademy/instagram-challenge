require 'rails_helper'

RSpec.feature "User has a profile picture", type: :feature do
  scenario "There is a upload pic option when signin up" do
    visit sign_up_path
    expect(page).to have_field 'user_profile_picture'
  end

  scenario "User can upload a picture when signin up" do
    visit sign_up_path
    fill_in "Username", with: "test_user"
    fill_in "Email", with: "test@mail.com"
    fill_in "Password", with: "password"
    attach_file('user_profile_picture', Rails.root + "spec/factories/Trollface.png")
    click_button "Sign up"

    within '.nav' do
      expect(page).to have_css "img[src*='Trollface.png']"
    end
  end
end
