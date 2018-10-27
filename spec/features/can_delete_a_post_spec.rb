require_relative '../helpers/custom_feature_helper'

RSpec.feature "Experience", type: :feature do
  scenario "Displays post caption" do
    sign_up
    create_post
    click_link 'DELETE MOMENT'
    expect(page).to_not have_content('Test Caption :)')
  end
end
