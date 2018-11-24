require "rails_helper"

RSpec.feature "New Post" do
  scenario "successfully upload post and shows on feed" do
    sign_up_with("test@instagram.com", "password")
    click_button "Post"
    expect(page).to have_content "test@instagram.com"
  end
end
