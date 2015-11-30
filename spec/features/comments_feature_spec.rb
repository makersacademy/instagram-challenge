require "rails_helper"

feature "comments" do
  before { Post.create(description: "My first post") }

  scenario "allows users to leave a comment" do
    write_comment("Nice one!")
    expect(page).to have_content("Nice one!")
    expect(current_path).to eq("/posts")
  end
end