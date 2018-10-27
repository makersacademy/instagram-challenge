require_relative '../helpers/custom_feature_helper'
RSpec.feature "Experience", type: :feature do
  scenario "User can only delete their own post" do
    sign_up
    create_post
    click_link 'SIGN OUT'
    sign_up_user_2
    expect(page).not_to have_link('DELETE MOMENT')
  end
end
