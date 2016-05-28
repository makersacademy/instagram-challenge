feature "deleting posts" do
  scenario "can delete the post" do
    post = create(:post, caption: "ready to delete")
    visit posts_path
    find(:xpath, "//a[contains(@href,'/posts/#{post.id}')]").click
    click_link "Delete"
    expect(page).to have_content "Your post was successfully deleted!"
    expect(page).not_to have_content "ready to delete"
    expect(current_path).to eq posts_path
  end
end
