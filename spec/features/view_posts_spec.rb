require 'rails_helper'

feature "viewing posts" do
  before do
    user = create :user
    first_post = create(:post, caption: "First post!", user: user)
    second_post = create(:post, caption: "Second post", user: user, id: 500)
  end
  context "when logged in" do
    scenario "can view all posts on homepage" do
      log_in
      expect(page).to have_content "First post!"
      expect(page).to have_content "Second post"
      expect(page).to have_css("img[src*='googlelogo.png']")
    end
  end

  context "when not logged in" do

    scenario "asked to log in first" do
      visit "/"
      expect(page).to have_content "Login"
    end
  end
end