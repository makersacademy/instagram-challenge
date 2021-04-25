require 'rails_helper'
require_relative 'helper_methods'


RSpec.describe "User can add comments", type: :system do
  before do
    driven_by(:rack_test)
    sign_up
    login
    create_post
  end

  it "shows a comment button on an individual post's page" do
    click_link "I love seeds!"
    expect(page).to have_button "Add comment"
  end
  it "allows a user to comment on a post" do
    click_link "I love seeds!"
    fill_in 'comment', with: 'Me too!'
    click_button 'Add comment'
    expect(page).to have_text 'Me too!'
  end
end
