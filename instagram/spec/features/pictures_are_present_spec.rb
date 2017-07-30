

require "rails_helper"


RSpec.feature "Pictures", type: :feature do

  context "when there are pictures in the database"  do

    before do
      visit '/'
      sign_up
      create_pic(caption: "hashtag")
      create_pic(caption: "pictwo")
    end

    context "the index" do

    scenario "should display them" do
      visit '/'
      expect(page).to have_content("hashtag")
      expect(page).to have_content("pictwo")
    end

    scenario "and they will be in reverse chronological order" do
        visit '/'
        expect('pictwo').to appear_before('hashtag')
    end

    scenario "and the pictures can be viewed individually" do
        visit '/'
        click_on "View Picture 2"
        expect(page).to have_content("pictwo")
        expect(page).to_not have_content("hashtag")
    end
  end
end

  context "when user is unregistered" do

    scenario "they can't add pictures to the index" do
      visit '/'
      click_on "Post Picture"
      expect(page).to have_content("You need to sign in or sign up before continuing.")
    end
  end

end
