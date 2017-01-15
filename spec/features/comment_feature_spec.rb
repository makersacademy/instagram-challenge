require 'rails_helper'

  feature "comments" do
    context "add comment" do
      scenario "I want a comment to be able to be added" do
        upload_image
        visit("/pictures")
        click_link("Comment on Quote 1")
        fill_in("Comment", with: "Nice Quote")
        click_button("Add comment")

        expect(current_path).to eq("/pictures")
      end
    end
  end
