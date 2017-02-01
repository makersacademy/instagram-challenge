require "rails_helper"

feature "instagratifications" do
  include Helpers

  user_1 = {
    email: 'rainbowdash@c9.io',
    password: 'seventhheaven'
  }

  picture_1 = {
    filepath: "./spec/assets/test1.jpg",
    description: "where do tests go?"
  }

  before do
    sign_up(user_1)
    add_picture(picture_1)
  end

  context "no instagratifications" do
    scenario "I want to see if picture got no ♥" do
      visit '/pictures'
      click_link("Test1")
      expect(page).to have_content("No ♥ :<")
    end
  end

  context "adding instagratifications" do
    scenario "I want to add an instagratification" do
      visit '/pictures'
      click_link("Test1")
      click_link("♡")
      expect(page).to have_content("1 ♥")
      expect(Instagratification.all.length).to eq 1
    end

    scenario "I can only add one instagratification" do
      visit '/pictures'
      click_link("Test1")
      click_link("♡")
      expect(page).not_to have_content("♡")
    end
  end

  context "rescinding instagratifications :<" do
    #tbc
  end
end
