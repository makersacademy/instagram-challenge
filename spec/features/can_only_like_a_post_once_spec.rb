require_relative '../helpers/custom_feature_helper'

RSpec.feature "Experience", type: :feature do
  scenario "User can only like a post once" do
    sign_up
    create_post
    click_link 'LIKE'
    click_link 'LIKE'
    expect(page).to have_content('❤️ 1')
  end
end
