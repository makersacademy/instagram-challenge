require 'rails_helper'

RSpec.feature "Update post", type: :feature do
  context "user signed in" do
    scenario "user adds new post then updates posts" do
      user = FactoryBot.create(:user)
      sign_in(user)
      post_photo
      expect(page).to have_content "This is my photo caption"
      click_link "View Post"
      click_link "Update"
      fill_in "Caption", with: "Updated caption"
      click_button "Post!"
      expect(page).not_to have_content "This is my photo caption"
      expect(page).to have_content "Updated caption"
    end
  end

end
