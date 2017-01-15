require 'rails_helper'

feature "pictures" do

  include Helpers

  user_1 = {
    email: 'rainbowdash@c9.io',
    password: 'seventhheaven'
  }

  user_2 = {
    email: 'pinkie@pie.me',
    password: 'cookiez'
  }

  picture_1 = {
    filepath: "./spec/assets/test1.jpg",
    description: "where do tests go?"
  }

  picture_2 = {
    filepath: "./spec/assets/test2.jpg",
    description: "Friendship is magic!"
  }


  context "no pictures have been added" do
    scenario "I want to see a prompt to add a picture" do
      sign_up(user_1)
      visit "/pictures"
      expect(page).to have_content("No pictures yet")
      expect(page).to have_link("Add a picture")
    end
  end

  context "pictures have been added" do
    before do
      sign_up(user_1)
      add_picture(picture_1)
    end
    scenario "I want to see pictures" do
      visit '/pictures'
      expect(page).to have_content("where do tests go?")
      expect(page).not_to have_content("No pictures yet")
      expect(page).to have_css("img[src*='test1']")
    end
  end

  context "adding pictures" do
    scenario "I want to add a picture, then see it" do
      sign_up(user_1)
      add_picture(picture_1)
      expect(current_path).to eq '/pictures'
      expect(page).to have_content "where do tests go?"
      expect(page).to have_content "Your picture has been added."
      expect(page).to have_css("img[src*='test1']")
    end

    scenario "I want to only add pictures when signed in" do
      visit '/pictures/new'
      expect(current_path).to eq '/users/sign_in'
      message = "You need to sign in or sign up before continuing."
      expect(page).to have_content(message)
    end
  end

  context "viewing pictures" do
    before do
      sign_up(user_1)
      add_picture(picture_1)
      add_picture(picture_2)
    end
    scenario "I want to view a picture on individual page" do
      visit '/pictures'
      click_link("Test2")
      expect(page).not_to have_content("where do tests go?")
      expect(page).to have_content("Friendship is magic!")
    end
  end

  context "editing pictures" do
    before do
      sign_up(user_1)
      add_picture(picture_2)
    end
    scenario "I want to edit a picture description" do
      visit '/pictures'
      click_link("Test2")
      click_link("Edit")
      fill_in "Description", with: "Team Brick!"
      click_button "Update"
      expect(page).to have_content("Team Brick!")
      expect(page).not_to have_content("Friendship is magic!")
    end

    scenario "I want my pictures to only be edited by me - view" do
      click_link("Sign out")
      sign_up(user_2)
      click_link("Test2")
      expect(page).not_to have_link("Edit")
    end

    scenario "I want my pictures to only be edited by me - controller" do
      click_link("Sign out")
      sign_up(user_2)
      visit "/pictures/#{Picture.first.id}/edit"
      expect(current_path).to eq "/pictures"
      message = "Naughty! You can only edit your own pictures!"
      expect(page).to have_content(message)
    end
  end

  context "deleting pictures" do
    scenario "I want my pictures to only be deleted by me - view" do
      visit "/"
      sign_up(user_1)
      add_picture(picture_2)
      click_link("Sign out")
      sign_up(user_2)
      click_link("Test2")
      expect(page).not_to have_link("Delete")
    end
    
    scenario "I want to delete a picture", :js => true do
      visit "/"
      sign_up(user_1)
      add_picture(picture_2)
      click_link("Test2")
      click_link("Delete")
      page.driver.browser.switch_to.alert.accept
      expect(page).to have_content "Picture has been deleted succesfully"
      expect(page).to have_content "No pictures yet"
      expect(page).not_to have_content "Friendship is magic!"
    end
  end
end
