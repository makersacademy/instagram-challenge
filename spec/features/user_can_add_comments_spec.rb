require 'rails_helper'

RSpec.feature "Can add a comment", type: :feature do
  scenario "Can add a comment" do
    sign_up
    add_post
    add_comment
    expect(page).to have_content("New comment")
  end
end
