require 'rails_helper'
require 'web_helpers'

RSpec.feature 'Posting an image', type: :feature do
  scenario 'Signed up users are able to post images' do
    sign_up_user
    sign_in_user
    click_link 'Post'
    expect(page).to have_field('post_description')
    expect(page).to have_field('post_image')
  end
end
