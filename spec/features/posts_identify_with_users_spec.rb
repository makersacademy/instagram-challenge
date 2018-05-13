require 'rails_helper'

RSpec.feature "Show username", type: :feature do
  scenario "Posts show the username" do
    sign_up
    add_post
    expect(page).to have_content("testname")
  end
end
