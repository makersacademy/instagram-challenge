feature "editing posts" do
  let!(:post) { create(:post, caption:"yolo") }
  before do
    sign_up
    visit posts_path
    find(:xpath, "//a[contains(@href,'/posts/#{post.id}')]").click
    click_link "Edit"
    fill_in "Caption", with: "Edited comment"
  end

  context "when update with a valid photo" do
    scenario "can edit the post" do
      attach_file("Image", "spec/files/images/poodle.jpg")
      click_button "Update"
      expect(page).to have_content "Edited comment"
      expect(page).to have_css("img[src*='poodle.jpg']")
      expect(page).not_to have_content "yolo"
      expect(page).not_to have_css("img[src*='hipster.jpg']")
    end
  end
  context "when update with a invalid photo" do
    scenario "can't update the post" do
      attach_file("Image", "spec/files/images/dummy.zip")
      click_button "Update"
      expect(page).to have_content "Uh oh! You need to select an image!"
    end
  end
end
