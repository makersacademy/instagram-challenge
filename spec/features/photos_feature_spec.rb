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
  context "adding photos" do
    scenario "users can add a photo" do
      add_photo
      expect(page).not_to have_content "No photos available"
      expect(page).to have_xpath "//img[contains(@src,'test_photo.png')]"
    end
    scenario "users cannot upload without selecting a photo" do
      click_link "Add photo"
      fill_in "Title", with: "Beach photo"
      fill_in "Description", with: "Not actually a photo to do with the beach"
      expect { click_button "Add Photo" }.not_to change(Photo, :count)
      expect(page).to have_content "You must select a photo to upload"
    end
    scenario "title and description can be left blank" do
      click_link "Add photo"
      attach_file "photo_image", Rails.root.join("spec","fixtures", "test_photo.png")
      expect { click_button "Add Photo" }.to change(Photo, :count).by(1)
    end
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
      before {
        add_photo
        @photo = Photo.last
        click_link "#{ @photo.id }"
        click_link "Edit Photo"
      }
      scenario "users can edit their photo information" do
        expect(page).to have_field("Title", with: "#{ @photo.title }")
        expect(page).to have_field("Description", with: "#{ @photo.description }")
        fill_in "Title", with: "Tetris score"
        fill_in "Description", with: "Just a random high score from when I played tetris"
        click_button "Edit Photo"
        photo_refresh = Photo.find(@photo.id)
        expect(photo_refresh.title).to eq "Tetris score"
        expect(photo_refresh.description).to eq "Just a random high score from when I played tetris"
        expect(current_path).to eq "/photos/#{ @photo.id }"
      end
      scenario "users can delete their photos" do
        click_link "Delete Photo"
        photo_refresh = 
        expect { Photo.find(@photo.id) }.to raise_error "Couldn't find Photo with 'id'=#{ @photo.id }"
        expect(current_path).to eq "/photos"
        expect(page).to have_content "Photo deleted"
      end
    end
  end
  context "users photo pages can be viewed by other users" do
    before {
      add_photo
      @user = User.last
      @photo = Photo.last
      click_link "Sign out"
    }
    scenario "from from viewing a users picture" do
      click_link "#{ @photo.id }"
      click_link "#{ @user.username }"
      expect(current_path).to eq "/users/#{ @user.id }"
      expect(page).to have_content "#{ @user.username }"
      expect(page).to have_xpath "//img[contains(@src,'test_photo.png')]"
    end
  end
  context "users not signed in can't access /photos and nested paths other than #show" do
    before { click_link "Sign out" }
    scenario "/photos" do
      visit "/photos"
      expect(page).to have_content "You need to sign in or sign up before continuing."
    end
    scenario "/photos/new" do
      visit "/photos/new"
      expect(page).to have_content "You need to sign in or sign up before continuing."
    end
    scenario "/photos/1/edit" do
      visit "/photos/1/edit"
      expect(page).to have_content "You need to sign in or sign up before continuing."
    end
  end
end