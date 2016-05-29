feature "deleting posts" do
  before do
    user = FactoryGirl.create(:user)
    post = FactoryGirl.create(:post, user: user)
    comment = FactoryGirl.create(:comment, user: user, post: post)
    log_in
  end

  scenario "can delete the post" do
    find(:xpath, "//a[contains(@href,'/posts/1/comments/1')]").click
    expect(page).to have_content "Congratulations, you've deleted this comment!"
    expect(page).not_to have_content "lol"
  end

end
