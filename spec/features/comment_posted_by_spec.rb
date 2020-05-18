require 'rails_helper'

RSpec.feature 'Comment Owner', type: :feature do

  scenario "displays the name of the user who commented on the picture" do
    user = FactoryBot.create(:user)
    login_as(user)
    upload_image
    comment

    within('.comment') do
      expect(page).to have_content "#{user.name} commented"
    end
  end

end
