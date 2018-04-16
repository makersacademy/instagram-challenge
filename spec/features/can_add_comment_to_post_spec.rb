require_relative '../helpers/custom_feature_helper'

RSpec.describe 'Experience', type: :feature do
  scenario 'Comment on a post' do
    sign_up
    create_post
    fill_in 'comment[body]', with: 'Test Comment!'
    click_button 'COMMENT'
    expect(page).to have_content('Test Comment!')
  end
end
