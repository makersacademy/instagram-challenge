require_relative '../helpers/custom_feature_helper'

RSpec.feature "Experience", type: :feature do
  scenario "Likes a post" do
    create_post
    click_link 'LIKE'
    expect(page).to have_content('❤️ 1')
  end
end
