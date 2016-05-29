feature "editing posts" do
  before do
    user = FactoryGirl.create(:user)
    post = FactoryGirl.create(:post, user: user)
    user2 = FactoryGirl.create(:user, email: "amy2@gmail.com", username: "amynic2", id: 2)
    post2 = FactoryGirl.create(:post, user: user2, id: 2)
    log_in
  end

  context "when user created post" do
    context "when update with a valid photo" do
      scenario "can edit the post" do
        find(:xpath, "//a[contains(@href,'/posts/1')]").click
        click_link "Edit"
        fill_in "Caption", with: "Edited comment"
        attach_file("Image", "spec/files/images/poodle.jpg")
        click_button "Update"
        expect(page).to have_content "Edited comment"
        expect(page).to have_css("img[src*='poodle.jpg']")
        expect(page).not_to have_content "nofilter"
        expect(page).not_to have_css("img[src*='hipster.jpg']")
      end
    end
    context "when update with a invalid photo" do
      scenario "can't update the post" do
        find(:xpath, "//a[contains(@href,'/posts/1')]").click
        click_link "Edit"
        fill_in "Caption", with: "Edited comment"
        attach_file("Image", "spec/files/images/dummy.zip")
        click_button "Update"
        expect(page).to have_content "Uh oh! You need to select an image!"
      end
    end
  end

  context "when not the user who created the post" do
    scenario "can't edit the post" do
      visit posts_path
      find(:xpath, "//a[contains(@href,'/posts/2')]").click
      expect(page).not_to have_link "Edit"
    end

    scenario "cannot edit the post via url path" do
      visit "/posts/2/edit"
      expect(page.current_path).to eq root_path
      expect(page).to have_content("That post doesn't belong to you!")
    end
  end
end
