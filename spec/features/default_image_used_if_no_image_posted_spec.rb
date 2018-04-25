require_relative '../helpers/custom_feature_helper'

RSpec.describe 'Experience', type: :feature do
  scenario 'Comment on a post' do
    sign_up
    create_post
    expect(page).to have_css("img[src*='moment-default.jpg']")
  end
end
