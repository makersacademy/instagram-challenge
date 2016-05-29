require 'rails_helper'

feature "editing posts" do
  before(:each) do
    user = FactoryGirl.create(:user)
    post = FactoryGirl.create(:post, user: user, id: 600)
    user2 = FactoryGirl.create(:user, email: "paco@mail.com", user_name: "pacojones", id: 2)
    post2 = FactoryGirl.create(:post, user: user2, id: 700)
    log_in
  end
  # after(:each) do
  #   DatabaseCleaner.clean_with(:truncation)
  # end

  context "when user created post" do
    context "when update with a valid photo" do
      scenario "can edit the post" do
        find(:xpath, "//a[contains(@href,'/posts/600')]").click
        click_link "Edit"
        fill_in "Caption", with: "Updated comment"
        attach_file("Image", "spec/files/images/tomate.jpg")
        click_button "Update"
        expect(page).to have_content "Updated comment"
        expect(page).to have_css("img[src*='tomate.jpg']")
        expect(page).not_to have_content "julio iglesias rocks"
        expect(page).not_to have_css("img[src*='julio.jpg']")
      end
    end
  context "when update with a invalid photo" do
    scenario "can't update the post" do
      find(:xpath, "//a[contains(@href,'/posts/600')]").click
      click_link "Edit"
      fill_in "Caption", with: "Edited comment"
      attach_file("Image", "spec/files/images/nopicha.ohh")
      click_button "Update"
      expect(page).to have_content "Oh no! Problem updating post, check the form"
    end
  end
  end

  context "when not the user who created the post" do
    scenario "can't edit the post" do
      visit posts_path
      find(:xpath, "//a[contains(@href,'/posts/700')]").click
      expect(page).not_to have_link "Edit"
    end

    scenario "cannot edit the post via url path" do
      visit "/posts/700/edit"
      expect(page.current_path).to eq root_path
      expect(page).to have_content("Nice try, but that post is not yours!")
    end
  end
end