feature "editing posts" do
  scenario "can edit the post" do
    post = create(:post, caption:"yolo")
    visit posts_path
    find(:xpath, "//a[contains(@href,'/posts/#{post.id}')]").click
    click_link "Edit"
    fill_in "Caption", with: "Edited comment"
    attach_file("Image", "spec/files/images/poodle.jpg")
    click_button "Update"
    expect(page).to have_content "Edited comment"
    expect(page).to have_css("img[src*='poodle.jpg']")
  end
end
