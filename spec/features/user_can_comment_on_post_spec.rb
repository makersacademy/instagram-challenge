require 'rails_helper'

RSpec.feature "New comment", type: :feature do

  before do
    sign_in_and_post
  end

  scenario "Can add a comment to a post" do
    fill_in "comment_message", with: "my comment"
    find(".submit-comment").click
    expect(page).to have_content "my comment"
  end
end
