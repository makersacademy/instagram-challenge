require 'rails_helper'

RSpec.feature "Timeline", type: :feature, js: true do
  scenario "User can see index page" do
    visit "/"
    expect(page).to have_content("Showing all Hams")
  end

  scenario "Can submit posts and view them" do
    visit "/hams/new"
    fill_in('ham_title', :with => 'test ham title')
    fill_in('ham_text', :with => 'test ham text')
    click_button('Save Ham')
    expect(page).to have_current_path('/hams')
    expect(page).to have_content("test ham text")
  end
end
