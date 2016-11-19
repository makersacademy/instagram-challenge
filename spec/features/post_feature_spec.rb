require 'rails_helper'

feature 'Posts' do

  context "no pictures have been posted" do

    scenario "should display a prompt to post a picture" do

      visit '/posts'
      expect(page).to have_content "No pictures posted yet"
      expect(page).to have_link "Post a picture"
    end
  end

  context "can create a post" do

    scenario "and display posts" do

      visit "/posts"
      click_link "Post a picture"
      attach_file('Image', "spec/files/images/bertie.jpg")
      fill_in "Caption", with: "Bertie #doggo"
      click_button "Create Post"
      expect(page).to have_content('#doggo')
      expect(page).to have_css("img[src*='bertie.jpg']")
    end

    scenario "cannot create a post without an image" do

      visit "/posts"
      click_link "Post a picture"
      fill_in "Caption", with: "No pic lmao"
      click_button "Create Post"
      expect(page).to have_content("Please add an image to your post")
    end
  end
end
