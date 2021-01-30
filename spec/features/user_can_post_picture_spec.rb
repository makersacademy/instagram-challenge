require 'rails_helper'
require_relative 'feature_helpers.rb'

RSpec.feature "Post", type: :feature do
  scenario "signed in user can make a post" do
    log_in
    # expect(page).to have_field("image")
    page.attach_file('post_image', './spec/features/test_image.png')
    expect(page).to have_field("post_caption")
    fill_in "post_caption", with: "My caption"
    click_button "Send"
    expect(current_path).to eq "/posts"
    expect(page).to have_content("My caption")
    expect(page).to have_content("TestUser")
    expect(page).to have_content(Time.now.strftime("%H:%M %-d %B %Y"))
    expect(page).to have_xpath("//img[contains(@src,'test_image.png')]")
  end
end
