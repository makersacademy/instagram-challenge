require 'rails_helper'

RSpec.feature "Must leave a message of at least 3 characters", type: :feature do
  scenario "User posts a 2 character message" do
    visit "/"
    click_link "New post"
    attach_file('Photo', File.absolute_path('./spec/features/Pineapple.png'))
    fill_in "Message", with: "Hi"
    click_button "Create Post"
    expect(page).to have_content("Message is too short")
  end
end
