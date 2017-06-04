require 'rails_helper'
require 'web_helpers'

RSpec.feature "Posts", type: :feature do

  scenario "a simple string", type: :feature do
    sign_up
    click_on("New Post")
    fill_in 'Body', with: 'I would describe an image'
    click_on('Post')
    expect(page).to have_content('I would describe an image')
  end
end
