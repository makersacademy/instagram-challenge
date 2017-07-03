require_relative './helpers/photo_feature_helpers_spec'

RSpec.feature "User Log Out", type: :feature do

  scenario "Users can Log out" do
    sign_up
    click_button "Log Out"
    expect(page).not_to have_content("Welcome to Simstagram Test_User!")
    expect(page).to have_content("Welcome to Simstagram!")
  end

end