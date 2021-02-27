require 'rails_helper'

feature "Sign in" do

  scenario "asks the user to enter username and password" do
    visit '/posts'
    expect(page).to have_content "Posts"

  end

end
