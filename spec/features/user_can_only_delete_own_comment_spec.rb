require_relative '../helpers/custom_feature_helper'
RSpec.feature "Experience", type: :feature do
  scenario "User can only delete their own comments" do
    sign_up
    create_post
    create_comment
    click_link 'SIGN OUT'
    sign_up_user_2
    expect(page).not_to have_link('DELETE COMMENT')
  end
end
