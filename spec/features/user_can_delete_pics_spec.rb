require 'rails_helper'
require 'web_helpers'

RSpec.feature "Timeline", type: :feature do

  before do
    @alice = User.create(email: "a@a.com", password: "abc123")
    sign_in @alice
  end

  scenario "Can delete a pic and go back to the index page" do
    post_pic
    visit "/pics"
    click_link "Destroy"
    expect(page).to have_no_content("This is the first pic")
  end

end
