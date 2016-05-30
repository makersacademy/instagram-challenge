feature "viewing posts" do
  before do
    user = create :user
    post_one = create(:post, caption: "Comment one", user: user)
    post_two = create(:post, caption: "Comment two", user: user, id: 2)
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
      error = "You need to sign in or sign up before continuing."
      expect(page).to have_content error
    end
  end
end
