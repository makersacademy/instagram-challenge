require 'rails_helper'
require 'features_helper'

feature 'Posts:' do
  
  scenario 'can submit posts' do
    sign_up_for_an_account
    post_an_image
    expect(page).to have_css '.image_post'
  end

  scenario 'can delete posts' do
    sign_up_for_an_account
    post_an_image
    click_button 'Delete'
    expect(page).not_to have_css '.image_post'
  end

  scenario 'can see the date and time for a post' do
    sign_up_for_an_account
    post_an_image
    expect(page).to have_content 'Posted on:'
  end
end