require_relative '../helpers/custom_feature_helper'

RSpec.feature "Experience", type: :feature do
  scenario "Deletes a comment" do
    create_post
    fill_in 'comment[body]', with: 'Test Comment!'
    click_button 'COMMENT'
    click_link 'DELETE COMMENT'
    expect(page).to_not have_content('Test Comment!')
  end
end
