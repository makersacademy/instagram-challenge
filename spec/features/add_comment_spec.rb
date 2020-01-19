require "rails_helper"

RSpec.feature "Timeline", :type => :feature do
  scenario "Comment on posts" do
    sign_up("myusername", "myemail@example.com", "password123")

    create_post("mypost", "url")

    click_on "New comment"
    fill_in :comment_text, with: "mycomment"
    click_on :commit
    
    expect(page).to have_text("mycomment")
  end
end
