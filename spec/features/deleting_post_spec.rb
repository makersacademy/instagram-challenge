feature "deleting posts" do
  scenario "can delete the post" do
    user = create(:user)
    log_in
    post = create(:post, caption: "ready to delete", user: user)
    visit posts_path
    find(:xpath, "//a[contains(@href,'/posts/#{post.id}')]").click
    click_link "Delete"
    expect(page).to have_content "Your post was successfully deleted!"
    expect(page).not_to have_content "ready to delete"
    expect(current_path).to eq posts_path
  end
end
