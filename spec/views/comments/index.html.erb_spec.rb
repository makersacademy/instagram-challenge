require 'rails_helper'
require_relative '../../support/web_helpers.rb'
RSpec.describe "reviews/new.html.erb", type: :view do
  feature "can add a comment" do
    scenario "user can add comment to post" do
      create_user
      add_post
      click_link "Logout"
      create_user2
      submit_comment
      expect(page).to have_content("this looks sicks")
    end
  end
end
