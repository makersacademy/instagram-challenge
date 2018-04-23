require 'rails_helper'

RSpec.feature "Deleting comment", type: :feature do
  before(:each) do
    sign_up
    add_post
    add_comment
  end

  scenario "Can delete a comment" do
    click_link "Delete comment"
    expect(page).not_to have_content("New comment")
  end

  scenario "Can't delete other's comments" do
    click_link "Back"
    click_link "Logout"
    sign_up("test4", "email@email.com")
    click_link "Beautiful sunset"
    expect(page).not_to have_content("Delete comment")
  end

end
