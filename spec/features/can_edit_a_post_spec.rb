require_relative '../helpers/custom_feature_helper'

RSpec.feature "Experience", type: :feature do
  scenario "Edits a post caption" do
    create_post
    click_link 'EDIT CAPTION'
    fill_in 'caption', with: ''
    fill_in 'caption', with: 'UPDATE CAPTION!!! :P'
    click_button 'SHARE MOMENT'
    expect(page).to have_content('UPDATE CAPTION!!! :P')
  end
end
