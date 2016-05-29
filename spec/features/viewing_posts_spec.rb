feature "viewing posts" do
  before do
    user = create :user
    post_one = create(:post, caption: "Comment one")
    post_two = create(:post, caption: "Comment two")
  end
  context "when logged in" do
    scenario "can view all posts on homepage" do
      log_in
      expect(page).to have_content "Comment one"
      expect(page).to have_content "Comment two"
      expect(page).to have_css("img[src*='hipster.jpg']")
    end
  end

  context "when not logged in" do
    scenario "asked to log in first" do
      visit "/"
      expect(page).to have_content "You need to sign in or sign up before continuing."
    end
  end
end
