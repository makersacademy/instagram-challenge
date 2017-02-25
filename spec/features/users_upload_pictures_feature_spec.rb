require 'rails_helper'

feature "User can upload photo" do

  let!(:target_page){"/pictures/new"}   # this has to be changed to /

  context "User not logged in" do
    it "will be sent to sign in page with an error message" do
      visit target_page

      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
      expect(current_path).to eq '/users/sign_in'
      expect(page).to have_content("You need to sign in or sign up before continuing.")
    end
  end

  context "User logged in" do
    it "can upload photo" do
      sign_up
      visit target_page
      attach_file('picture[image]', Rails.root + 'spec/features/capy-little-large.jpg')
      click_button "Share Pic"
      save_and_open_page
      expect(page).to have_xpath("//img[@class='users_pics']")
    end
  end
end
