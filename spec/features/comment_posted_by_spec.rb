require 'rails_helper'

RSpec.feature 'Comment Owner', type: :feature do

  scenario "displays the name of the user who commented on the picture" do
    user = FactoryBot.create(:user)
    login_as(user)
    upload_image
    fill_in "comment_text",	with: 'This is a comment on an image'
    click_button 'Create Comment'
    expect(page).to have_content "Comment by: #{user.name}"
  end

end
