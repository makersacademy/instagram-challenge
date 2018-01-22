require 'rails_helper'

RSpec.feature "Deleting comments", type: :feature do

  before(:each) do
    create_crepe_post
    create_comment(comment: "Yummmmm! :) ")
  end

  scenario "Comments can be deleted" do
    # expect { delete_comment }.to change{ Comment.count }.by -1
    click_on "Delete Comment"
    expect(page).to have_content("Your comment has been succesfully deleted")
    expect(page).to_not have_content("Yummmmm! :) ")
  end
end
