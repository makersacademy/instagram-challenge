require 'rails_helper'
require 'web_helpers'

RSpec.feature "Posts", type: :feature do
  scenario "a simple string", type: :feature do
    sign_up
    click_on("Post")
    fill_in "Description", with: 'I would describe an image'
    expect(page).to have_content('I would describe an image')
  end
end
