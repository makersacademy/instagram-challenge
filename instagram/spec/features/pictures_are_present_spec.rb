

require "rails_helper"


RSpec.feature "Pictures", type: :feature do

  context "snaps are in db"  do

    before do
      visit '/'
      sign_up
      User.first.pictures.create(caption: "hashtag").save
      User.first.pictures.create(caption: "pictwo").save
    end

    context "index" do

    scenario "should display them" do
      visit '/'
      expect(page).to have_content("hashtag")
      expect(page).to have_content("pictwo")
    end

    scenario "in reverse chrono order" do
        visit '/'
        expect('pictwo').to appear_before('hashtag')
    end

    scenario "pics can be viewed individually" do
        visit '/'
        click_on "View Picture 2"
        expect(page).to have_content("pictwo")
        expect(page).to_not have_content("secondhashtag")
    end

  end

  end

  context "no snaps in db" do

    context "when an account holder" do

    scenario "can add pics" do
      visit '/'
      sign_up
      click_on "Post Picture"
      fill_in "picture_caption", with: "hashtagthree"
      click_button "Post"
      expect(page).to have_content("hashtagthree")
    end


  # return to provide more comp error checks on creation

  end

  context "when not an account holder" do

  scenario "cannot add pics" do
    visit '/'
    click_on "Post Picture"
    expect(page).to have_content("You need to sign in or sign up before continuing.")
  end

end

  end





end
