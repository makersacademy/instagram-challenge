require 'rails_helper'

feature "Delete a comment" do

  before :each do
    sign_up
    create_picture
    create_comment
  end

  scenario "can delete current user's own comment" do
    click_link "Delete comment"
    expect(page).not_to have_content "I really like this piece of lint"
  end

  scenario "unable to delete another user's comment" do
    click_link "Sign out"
    sign_up_user_2
    click_link "Show me the lint"
    find("img[src*='https://i1.wp.com/krinkle.net/wordpress/img/AppleMouse/TheDirtErrLint.jpg']").click
    expect(page).not_to have_content "Delete comment"
  end
end
