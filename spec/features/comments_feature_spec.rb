require "rails_helper"

feature "comments" do
  before { Post.create(description: "My first post") }

  scenario "allows users to leave a comment" do
    visit("/posts")
    click_link("Write a comment")
    fill_in("Thoughts", with: "Nice one!")
    click_button("Send")
    expect(page).to have_content("Nice one!")
    expect(current_path).to eq("/posts")
  end
end