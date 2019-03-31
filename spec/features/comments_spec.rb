require 'rails_helper'
require 'features_helper'

feature 'Comments' do

  scenario 'can add a comment to a post' do
    sign_up_for_an_account
    post_an_image
    click_link 'Post detail'
    expect(page).to have_button 'Create Comment'
    fill_in :comment_body, with: 'I love how your post is not selling any products to me insidiously...'
    click_button 'Create Comment'
    expect(page).to have_content 'Comments (1)'
  end
end