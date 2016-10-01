require 'rails_helper'

feature 'Profile page' do

  context 'At least one post' do
    before do
      sign_up
      create_post(caption: "Jonny's post")
    end

    scenario "We see a message 'check out posts for this user' " do
      click_link "Profile"
      expect(page).to have_content "Check out jonny@mail.com's posts!"
    end

    scenario "We can see all posts by this user on their profile page" do
      click_link "Profile"
      expect(page).to have_content "Jonny's post"
    end

    scenario "User should NOT see other user's posts on their profile page" do
      click_link 'Sign out'
      sign_up(email: "cheekyimposter@mail.com")
      click_link "Profile"
      expect(page).to have_content "cheekyimposter@mail.com"
      expect(page).not_to have_content "Jonny's post"
    end
  end

  context 'No posts' do
    scenario "We are told that this user has no posts" do
      sign_up
      click_link "Profile"
      expect(page).to have_content "jonny@mail.com has not posted to Instarails yet"
    end
  end
end
