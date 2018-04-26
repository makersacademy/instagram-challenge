require_relative '../helpers/custom_feature_helper'

RSpec.feature "Experience", type: :feature do
  scenario "User cano only like a post if signed in" do
    sign_up
    create_post
    sign_out
    click_link 'LIKE'
    expect(page).to have_content('❤️ 0')
  end
end
