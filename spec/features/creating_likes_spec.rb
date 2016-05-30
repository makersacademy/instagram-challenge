feature "creating likes" do

  before do
    user = FactoryGirl.create(:user)
    post = FactoryGirl.create(:post, user: user)
    log_in
  end

  scenario "like a post" do
    visit "/"
    find("a[href='#{like_post_path(1)}']").click
    expect(page).to have_css("a.glyphicon-heart")
    expect(page).to have_content "You liked this post!"
    expect(page).to have_css("div#likes_1", text: User.find(1).username)
  end

end
