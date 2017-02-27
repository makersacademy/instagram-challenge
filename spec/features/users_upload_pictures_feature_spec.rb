require 'rails_helper'

feature "User can upload photo" do

  context "User not logged in" do
    it "will be sent to sign in page with an error message" do
      visit "/pictures/new"

      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
      expect(current_path).to eq '/users/sign_in'
      expect(page).to have_content("You need to sign in or sign up before continuing.")
    end
  end

  context "User logged in" do
    it "can upload photo" do
      sign_up
      upload_pic
      expect(page).to have_xpath("//img[@class='users_pics']")
    end
  end
end
