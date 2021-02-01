require 'rails_helper'
require_relative 'sign_up_helper_spec'

RSpec.feature "Post", type: :feature do
  scenario "Logged in users can post" do
    sign_up_kiki
    fill_in "caption", with: "This is a caption"
    click_button "Post Picture"
    expect(current_path).to eq posts_path
    expect(page).to have_content "This is a caption"
  end
end
