require 'rails_helper'
require 'web_helpers'

RSpec.feature "Posts", type: :feature do
  scenario "have images and captions", type: :feature do
    sign_up
    click_on("New Post")
    attach_file('Image', Rails.root + 'spec/support/test_image.jpeg')
    fill_in('post_body', with: 'I would describe an image')
    click_on('Create Post')
    expect(page).to have_content('I would describe an image')
  end
end
