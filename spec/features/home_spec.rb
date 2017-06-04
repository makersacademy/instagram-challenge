require 'rails_helper'

feature "Visits the home page" do
  scenario "user can access the home page" do
    visit "/posts"
    expect(page).to have_http_status(200)
  end
end
