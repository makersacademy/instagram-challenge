require 'rails_helper'

RSpec.feature 'Comment Owner', type: :feature do

  scenario "displays the name of the user who commented on the picture" do
    user = FactoryBot.create(:user)
    login_as(user)
    upload_image
    comment
    expect(page).to have_content "Comment by: #{user.name}"
  end

end
