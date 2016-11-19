require 'rails_helper'

feature 'Posts' do
  context "no pictures have been posted" do
    scenario "should display a prompt to post a picture" do
      visit '/posts'
      expect(page).to have_content "No pictures posted yet"
      expect(page).to have_link "Post a picture"
    end
  end
end
