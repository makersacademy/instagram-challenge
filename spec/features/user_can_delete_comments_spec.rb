require 'rails_helper'

RSpec.feature "Deleting comment", type: :feature do
  scenario "Can delete a comment" do
    sign_up
    add_post
    add_comment
    click_link "Delete"
    expect(page).not_to have_content("New comment")
  end
end
