require 'rails_helper'

RSpec.feature "Deleting post", type: :feature do
  scenario "Can delete a post" do
    sign_up
    add_post
    add_comment
    expect(page).to have_content("New comment")
  end
end
