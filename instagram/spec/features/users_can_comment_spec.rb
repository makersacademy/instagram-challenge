
require "rails_helper"

RSpec.feature "User commenting", type: :feature do

  context "when user is signed in" do

    before do
      visit '/'
      sign_up
      User.first.pictures.create(caption: "hashtag").save
    end

    scenario "individual pics will have comment forms" do
      visit '/'
      click_on "View Picture 1"
      expect(page).to have_content("Leave a comment")
    end


    scenario "users can leave a comment on another's users post" do
      visit '/'
      sign_out
      sign_up(username: "anon", email: "anon@gmail.com", password: "654321", password_confirmation: "654321")
      User.find(2).pictures.create(caption: "anon").save
      click_on "View Picture 1"
      fill_in "comment_content", with: "a selfie a day keeps contentment at bay"
      click_on "Comment"
      expect(page).to have_content("Comment saved!")
    end

  end

  context "when user is not signed in" do
    before do
      visit '/'
      sign_up
      User.first.pictures.create(caption: "hashtag").save
      sign_out
    end
    scenario "comment forms will be hidden" do
      visit '/'
      click_on "View Picture 1"
      expect(page).to_not have_content("Leave a comment")
    end
  end

end
