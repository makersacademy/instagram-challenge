require 'rails_helper'
require 'web_helpers'

RSpec.feature "Timeline", type: :feature do

  before do
    @alice = User.create(email: "a@a.com", password: "abc123")
    sign_in @alice
  end

  scenario "Can edit a pic and go back to the pic page" do
    post_pic
    visit "/pics"
    click_link "Show"
    click_link "Edit"
    fill_in "Description", with: "This is the first pic - updated"
    click_button "Update Pic"
    expect(page).to have_content("This is the first pic - updated")
  end

end
