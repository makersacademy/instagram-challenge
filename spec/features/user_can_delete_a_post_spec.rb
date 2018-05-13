require 'rails_helper'

RSpec.feature "Deleting post", type: :feature do
  scenario "Can delete a post" do
    sign_up
    add_post
    click_link "Delete"
    expect(page).not_to have_content("Changed description")
    expect(page).to have_current_path("/posts")
  end
end
