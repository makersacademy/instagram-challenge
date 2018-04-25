require_relative '../helpers/custom_feature_helper'

RSpec.feature 'Experience', type: :feature do
  scenario 'Post image and caption' do
    sign_up
    create_img_post
    expect(page).to have_css("img[src*='test.jpg']")
  end
end
