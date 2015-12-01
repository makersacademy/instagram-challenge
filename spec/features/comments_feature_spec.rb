require "rails_helper"

feature "comments" do
  scenario "allows users to leave a comment" do
    sign_up
    create_post("My first post")
    write_comment("Nice one!")
    expect(page).to have_content("Nice one!")
    expect(current_path).to eq("/posts")
  end
end