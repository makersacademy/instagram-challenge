require 'rails_helper'

RSpec.feature "editing comments", type: :feature do

  before do
    create_crepe_post
    create_comment(comment: "Yummmmm! :) ")
  end

  scenario "Comments can be edited" do
    click_on "Edit Comment"
    fill_in "comment[comment]", with: "I'd like some!!"
    click_on "Update Comment"
    expect(page).to have_content("Your comment has succesfully been updated.")
    expect(page).to have_content("I'd like some!!")
    expect(page).not_to have_content("Yummmmm! :) ")
  end

end
