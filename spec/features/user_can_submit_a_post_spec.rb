require 'rails_helper'

RSpec.feature "post", type: :feature do
  scenario "allows a User to submit a post" do
    visit '/'
    click_link 'New Post'
    fill_in "Description", with: "This is a photo of my dog! She is super cute!"
    click_button "Submit Post"
    expect(page).to have_content("This is a photo of my dog! She is super cute!")
  end
end
