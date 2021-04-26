require 'rails_helper'

RSpec.feature "post", type: :feature do
  scenario "allows a User to submit a post" do
    visit '/'
    # need to add sign up/logging in here as it only shows the New post link when looged in
    click_link 'New Post'
    fill_in "Description", with: "This is a photo of my dog! She is super cute!"
    click_button "Submit Post"
    expect(page).to have_content("This is a photo of my dog! She is super cute!")
  end
#need to add testing for adding a photo to the post

end
