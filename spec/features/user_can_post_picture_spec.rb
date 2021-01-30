require 'rails_helper'
require_relative 'feature_helpers.rb'

RSpec.feature "Post", type: :feature do
  scenario "signed in user can post a picture" do
    log_in
    # expect(page).to have_field("Attach picture")
    # SOMEHOW ATTACH A PICTURE???
    expect(page).to have_field("Message")
    fill_in "Message", with: "My message"
    click_link "Post!"
    expect(current_path).to eq "/posts"
    expect(page).to have_content("My message")
  end
end
