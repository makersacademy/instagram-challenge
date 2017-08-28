require 'rails_helper'

RSpec.feature "Comments", type: :feature do
  scenario "Can submit comments on a post" do
    sign_up
    create_new_post
    fill_in "comment_message", with: "This is a comment"
    click_button "Submit"
    expect(page).to have_content("This is a comment")
  end
end
