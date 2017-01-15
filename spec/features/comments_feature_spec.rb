require 'rails_helper'

feature "commenting" do
  include Helpers

  user_1 = {
    email: 'rainbowdash@c9.io',
    password: 'seventhheaven'
  }

  user_2 = {
    email: 'pinkie@pie.me',
    password: 'cookiez'
  }

  picture_2 = {
    filepath: "./spec/assets/test2.jpg",
    description: "where do tests go?"
  }

  before do
    sign_up(user_1)
    add_picture(picture_2)
  end

  context "adding comments" do
    scenario "I want to add a comment uder a picture" do
      visit '/pictures'
      click_link("Test2")
      fill_in "Add Comment", with: "Such lovely bricks!"
      click_button "Submit"
      expect(current_path).to eq "/pictures/#{Picture.first.id}"
      expect(page).to have_content("Such lovely bricks!")
    end

    scenario "I need to be signed in to comment" do
      click_link "Sign out"
      visit '/pictures'
      click_link("Test2")
      expect(page).not_to have_content "Add Comment"
    end
  end

  context "deleting comments" do
    before do
      visit '/pictures'
      click_link("Test2")
      fill_in "Add Comment", with: "Such lovely bricks!"
      click_button "Submit"
    end

    scenario "I want to be able to delete my comment" do
      click_link "x"
      expect(page).not_to have_content("Such lovely bricks!")
      expect(page).to have_content("Comment deleted succesfully")
    end

    scenario "I don't want others to delete my comment - view" do
      click_link "Sign out"
      sign_up(user_2)
      expect(page).not_to have_link("x")
    end
  end



end
