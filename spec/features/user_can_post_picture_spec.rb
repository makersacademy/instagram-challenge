require 'rails_helper'

RSpec.feature "Post", type: :feature do
  scenario "signed in user can make a post" do
    log_in
    expect(page).to have_field("post_image")
    page.attach_file('post_image', './spec/fixtures/files/test_image.png')
    expect(page).to have_field("postcaption")
    fill_in "postcaption", with: "My caption"
    click_button "Send"
    # Another error ActiveSupport::MessageVerifier::InvalidSignature
    expect(current_path).to eq "/posts"
    expect(page).to have_content("My caption")
    expect(page).to have_content("TestUser")
    expect(page).to have_content(Time.now.strftime("%H:%M %-d %B %Y"))
    expect(page).to have_xpath("//img[contains(@src,'test_image.png')]")
  end
end
