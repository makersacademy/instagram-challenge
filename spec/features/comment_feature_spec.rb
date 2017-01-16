require 'rails_helper'

  feature "comments" do
    context "add comment" do

      scenario "I want to be able to see a comment that has been added" do
        upload_image
        visit("/pictures")
        click_link("Comment on Quote 1")
        fill_in("Comment", with: "Nice Quote")
        click_button("Add comment")
        visit("/pictures/1")

        expect(page).to have_content("Nice Quote")
      end
    end
  end
