require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  scenario "new post is displayed" do
    visit "/posts"
    fill_in "Content", with: "Hello, world!"
    click_button "Submit"
    
    posts = page.all(".card-text")
    expect(posts[0]).to have_content "Hello, world!"
  end
end