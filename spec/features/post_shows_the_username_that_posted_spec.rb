require_relative '../helpers/custom_feature_helper'

RSpec.feature "Experience", type: :feature do
  scenario "Username is displayed for each post" do
    sign_up
    create_post
    expect(page).to have_content("testUser")
  end
end
