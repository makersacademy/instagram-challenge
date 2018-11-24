require "rails_helper"

RSpec.feature "Upload Photo" do
  scenario "successfully upload photo and shows on feed" do
    sign_up_with("test@instagram.com", "password")
    click_button "Upload Photo"
    expect(page).to have_content "test@instagram.com"
  end
end
