require "rails_helper"

feature "photos" do
  before do
    visit "/"
    sign_up
  end
  context "users can view their photos:" do
    scenario "no photos uploaded it will display message" do
      expect(page).to have_content "No photos available"
    end
  end
  scenario "users can add a photo" do
    add_photo
    expect(page).not_to have_content "No photos available"
    expect(page).to have_xpath "//img[contains(@src,'test_photo.png')]"
  end
  context "photos can be viewed individually" do
    scenario "by anyone" do
      add_photo
      click_link "Sign out"
      photo = Photo.last
      click_link "#{photo.id}"
      expect(page).to have_xpath "//img[contains(@src,'test_photo.png')]"
      expect(page).to have_content "Beach photo"
      expect(page).to have_content "Not actually a photo to do with the beach"
      expect(page).not_to have_link "Edit Photo"
    end
    context "by the photo owner" do
      scenario "from their own page" do
        add_photo
        photo = Photo.last
        click_link "#{ photo.id }"
        expect(page).to have_xpath "//img[contains(@src,'test_photo.png')]"
        expect(page).to have_content "Beach photo"
        expect(page).to have_content "Not actually a photo to do with the beach"
        expect(page).to have_link "Edit Photo"
      end
      scenario "from the home page" do
        add_photo
        click_link "Home"
        photo = Photo.last
        click_link "#{ photo.id }"
        expect(page).to have_xpath "//img[contains(@src,'test_photo.png')]"
        expect(page).to have_content "Beach photo"
        expect(page).to have_content "Not actually a photo to do with the beach"
        expect(page).to have_link "Edit Photo"
      end
    end
    context "users can edit/delete photos" do
      scenario "users can edit their photo information" do
        add_photo
        photo = Photo.last
        click_link "#{ photo.id }"
        click_link "Edit Photo"
        expect(page).to have_field("Title", with: "#{ photo.title }")
        expect(page).to have_field("Description", with: "#{ photo.description }")
        expect(page).to have_link "Delete Photo"
      end
    end
  end
end
def sign_up(email: email="test@email.co.uk")
  click_link "Sign up"
  fill_in "Email", with: "Test@email.co.uk"
  fill_in "Password", with: "testtest"
  fill_in "Password confirmation", with: "testtest"
  click_button "Sign up"
  click_link "My Photos"
end
def add_photo
  click_link "Add photo"
  fill_in "Title", with: "Beach photo"
  fill_in "Description", with: "Not actually a photo to do with the beach"
  attach_file "photo_image", Rails.root.join("spec","fixtures", "test_photo.png")
  click_button "Add Photo"
end