require 'rails_helper'
feature "Post" do
  scenario "User can see Instagram's homepage" do
    visit '/'
    expect(page).to have_content "Instagram"
  end

end
