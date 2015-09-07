require "rails_helper"

feature "home" do
  before { visit "/" }
  context "user sees appropriate buttons," do
    context "when not signed in" do
      scenario "should see sign in and up links on home page" do
        expect(page).to have_link("Sign in")
        expect(page).to have_link("Sign up")
      end
      scenario "shouldn't see sign out link on home page" do
        expect(page).not_to have_link("Sign out")
      end
    end
    context "when signed in" do
      before { 
        sign_up
        visit "/"
      }
      scenario "should see sign out link on home page" do
        expect(page).to have_link("Sign out")
      end
      scenario "shouldn't see sign up and in links on home page" do
        expect(page).not_to have_link("Sign in")
        expect(page).not_to have_link("Sign up")
      end
    end
  end
  context "users can see photos on the home page" do
    scenario "no photos uploaded it will display message" do
      expect(page).to have_content "No photos available"
    end
  end
  context "Signed in users can view photos:" do
    scenario "signed in" do
      sign_up
      visit "/"
      expect(page).to have_link "My Photos"
    end
    scenario "signed out don't have the option" do
      expect(page).not_to have_link "My Photos"
    end
  end
  scenario "pictures are displayed on home screen for all to see" do
    sign_up
    add_photo
    click_link "Home"
    expect(page).not_to have_content "No photos available"
    expect(page).to have_xpath "//img[contains(@src,'test_photo.png')]"
    click_link "Sign out"
    expect(page).not_to have_content "No photos available"
    expect(page).to have_xpath "//img[contains(@src,'test_photo.png')]"
  end
end