feature "deleting posts" do
  before(:each) do
    user = FactoryGirl.create(:user)
    post = FactoryGirl.create(:post, user: user)
    user2 = FactoryGirl.create(:user, email: "sergio2@gmail.com", user_name: "sergio2", id: 800)
    post2 = FactoryGirl.create(:post, user: user2, id: 800)
    log_in
  end

  after(:each) do
    DatabaseCleaner.clean_with(:truncation)
  end

  context "when user created post" do
    scenario "can delete the post" do
      find(:xpath, "//a[contains(@href,'/posts/1')]").click
      click_link "Delete"
      expect(page).to have_content "Post deleted"
      expect(page).not_to have_content "Delete Post"
      expect(current_path).to eq posts_path
    end
  end

  context "when user didn't create post" do
    scenario "can't delete the post" do
      find(:xpath, "//a[contains(@href,'/posts/800')]").click
      expect(page).not_to have_link "Delete"
    end

    scenario "cannot delete the post via url path" do
      page.driver.submit :delete, "posts/800", {}
      expect(page.current_path).to eq root_path
      expect(page).to have_content("Nice try, but that post is not yours!")
    end
  end
end