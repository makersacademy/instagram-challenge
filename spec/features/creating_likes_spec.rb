feature "creating likes" do

  let(:max_users_id) { PostsHelper::LIKERS_MAX + 1}

  before do
    user = FactoryGirl.create(:user)
    post = FactoryGirl.create(:post, user: user)
    log_in
  end

  feature "liking a post" do
    context "when haven't already" do
      scenario "like a post, fill heart and add to list of likers" do
        visit "/"
        find("a[href='#{like_post_path(1)}']").click
        expect(page).to have_css("a.glyphicon-heart")
        expect(page).to have_content "You liked this post!"
        expect(page).to have_css("div#likes_1", text: "amynic")
      end
    end

    context "when already max number of likers' names displayed" do
      scenario "like a post, fill heart and add to list of likers" do
        click_link "Logout"
        (2..max_users_id).each do |num|
          user = FactoryGirl.create(:user, id: num,
                                    email: "#{num.to_s}email@gmail.com",
                                    username: "#{num.to_s}username")
          log_in({email: "#{num.to_s}email@gmail.com", password: "testtest"})
          visit "/"
          find("a[href='#{like_post_path(1)}']").click
          click_link "Logout"
        end
        log_in
        visit "/"
        find("a[href='#{like_post_path(1)}']").click
        expect(page).to have_css("a.glyphicon-heart")
        expect(page).to have_content "You liked this post!"
        expect(page).to have_css("div#likes_1", text: "#{max_users_id} likes")
      end
    end

    context "when have already liked" do
      scenario "cannot like again" do
        visit "/"
        find("a[href='#{like_post_path(1)}']").click
        page.driver.submit :get, "posts/1/like", {}
        expect(page).not_to have_content "amynic and amynic like this"
      end
    end
  end

  feature "unliking a post" do
    scenario "unlike a post, empty heart and remove from list of likers" do
      visit "/"
      find("a[href='#{like_post_path(1)}']").click
      find("a[href='#{unlike_post_path(1)}']").click
      expect(page).to have_css("a.glyphicon-heart-empty")
      expect(page).to have_content "You unliked this post!"
      expect(page).not_to have_css("div#likes_1", text: "amynic")
    end
  end

end
