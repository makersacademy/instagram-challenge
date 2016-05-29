require 'rails_helper'

feature "create posts" do
  before(:each) do
    user = create :user
  end
  after(:each) do
    DatabaseCleaner.clean_with(:truncation)
  end


  context "when image is selected" do
    scenario "can create a post" do
      log_in
      click_link "New Post"
      attach_file("Image", "spec/files/images/googlelogo.png")
      fill_in "Caption", with: "google logo"
      click_button "Create"
      expect(page).to have_content "google logo"
      expect(page).to have_css("img[src*='googlelogo.png']")
      expect(page).to have_xpath("//div[@class='user-name']", :text => 'sergioet')
    end
  end
  context "when image is not selected" do
    scenario "can not create a post" do
      log_in
      click_link "New Post"
      click_button "Create"
      expect(page).to have_content "Oh no! Problem creating post, check the form"
    end
  end
end