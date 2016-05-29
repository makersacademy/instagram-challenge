require 'rails_helper'

feature "create posts" do
  before do
    user = create :user
    sign_up
    click_link "New Post"
  end

  context "when image is selected" do
    scenario "can create a post" do
      attach_file("Image", "spec/files/images/googlelogo.png")
      fill_in "Caption", with: "google logo"
      click_button "Create"
      expect(page).to have_content "google logo"
      expect(page).to have_css("img[src*='googlelogo.png']")
      expect(page).to have_xpath("//div[@class='user-name']", :text => 'test')
    end
  end
  context "when image is not selected" do
    scenario "can not create a post" do
      click_button "Create"
      expect(page).to have_content "Oh no! Problem creating post, check the form"
    end
  end
end