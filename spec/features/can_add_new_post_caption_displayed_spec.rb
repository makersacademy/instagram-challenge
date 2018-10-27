require_relative '../helpers/custom_feature_helper'

RSpec.feature "Experience", type: :feature do
  scenario "Displays post caption" do
    sign_up
    create_post
    expect(page).to have_content('Test Caption :)')
  end
end
