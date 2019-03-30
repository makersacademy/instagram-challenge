require 'rails_helper'
require 'features_helper'

feature 'Posts:' do
  scenario 'can submit posts' do
    sign_up_for_an_account
    visit '/posts/new'
    attach_file 'post_image', './spec/images/mage.jpg'
    click_button 'Submit Post'
    expect(page).to have_css '.image_post'
  end
end