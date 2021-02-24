require 'rails_helper'

RSpec.describe "PostAPictures", type: :system do
  before do
    driven_by(:rack_test)
  end

  xit "user can post a picture and see it displayed" do
    visit "/"
    click_on "Sign up"
    fill_in "user_email", with: DEFAULT_EMAIL
    fill_in "user_password", with: DEFAULT_PASSWORD
    fill_in "user_password_confirmation", with: DEFAULT_PASSWORD
    click_button "Sign up"

    find("#new_post").click

  end


end
