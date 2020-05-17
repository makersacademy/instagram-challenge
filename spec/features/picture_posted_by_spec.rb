require 'rails_helper'

RSpec.feature 'Image Owner', type: :feature do
  before do
    user = FactoryBot.create(:user)
    login_as(user)
  end

  scenario "displays the name of the user who posted the picture" do
    upload_image
    expect(page).to have_content 'Posted by: Ruby Rails'
  end

end
