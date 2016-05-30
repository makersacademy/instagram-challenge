feature "deleting posts" do
  before do
    user = FactoryGirl.create(:user)
    post = FactoryGirl.create(:post, user: user)
    user2 = FactoryGirl.create(:user, email: "amy2@gmail.com",
                                      username: "amynic2", id: 2)
    post2 = FactoryGirl.create(:post, user: user2, id: 2)
    log_in
  end

  context "when user created post" do
    scenario "can delete the post" do
      find("a[href='#{post_path(1)}']").click
      click_link "Delete"
      expect(page).to have_content "Your post was successfully deleted!"
      expect(page).not_to have_content "ready to delete"
      expect(current_path).to eq posts_path
    end
  end

  context "when user didn't create post" do
    scenario "can't delete the post" do
        find("a[href='#{post_path(2)}']").click
      expect(page).not_to have_link "Delete"
    end

    scenario "cannot delete the post via url path" do
      page.driver.submit :delete, "posts/2", {}
      expect(page.current_path).to eq root_path
      expect(page).to have_content("That post doesn't belong to you!")
    end
  end
end
