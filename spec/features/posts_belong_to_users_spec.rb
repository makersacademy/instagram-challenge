require 'rails_helper'
require 'web_helpers'

RSpec.feature "Post belong to Users", type: :feature do

  scenario "posts have their name on", type: :feature do
    sign_up
    click_on("New Post")
    fill_in 'Body', with: 'Expecting my credentials on this post'
    click_on('Post')
    expect(page).to have_content("Testy:")
    expect(page).to have_content("Expecting my credentials on this post")
  end
end
