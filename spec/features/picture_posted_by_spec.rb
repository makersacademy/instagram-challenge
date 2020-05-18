require 'rails_helper'

RSpec.feature 'Image Owner', type: :feature do

  scenario "displays the name of the user who posted the picture" do
    user = FactoryBot.create(:user)
    login_as(user)
    upload_image
    expect(page).to have_content "#{user.name} posted"
  end

end
