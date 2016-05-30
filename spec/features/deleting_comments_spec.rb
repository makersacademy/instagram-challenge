feature "deleting comments" do
  before do
    user = FactoryGirl.create(:user)
    post = FactoryGirl.create(:post, user: user)
    comment = FactoryGirl.create(:comment, user: user, post: post)
    user2 = FactoryGirl.create(:user, email: "amy2@gmail.com",
                                      username: "amynic2", id: 2)
    log_in
  end

  context "when user wrote the comment" do
    scenario "can delete the post" do
      find(:xpath, "//a[contains(@href,'/posts/1/comments/1')]").click
      expect(page).not_to have_content "lol"
    end
  end

  context "when user didn't write the comment" do
    scenario "can't see delete link" do
      click_link "Logout"
      log_in(email: "amy2@gmail.com", password: "testtest")
      expect(page).not_to have_css "//a[contains(@href,'/posts/1/comments/1')]"
    end

    scenario "can't delete comment via url link" do
      click_link "Logout"
      log_in(email: "amy2@gmail.com", password: "testtest")
      page.driver.submit :delete, "posts/1/comments/1", {}
      expect(page).to have_content "That comment doesn't belong to you!"
      expect(page).to have_content "lol"
    end
  end

end
