require 'rails_helper'

RSpec.feature "Comment on post", type: :feature do
  scenario "User can comment on post if signed in" do
    user = FactoryBot.create(:user)
    sign_in(user)
    post_photo
    click_link "View Post"
    expect(page).to have_content "0 Comments"
    within "#new_comment" do
      fill_in "comment_body", with: "this is a great post"
      click_button "Post!"
    end
    expect(page).to have_content "this is a great post"
    expect(page).to have_content "1 Comments"
  end

end
