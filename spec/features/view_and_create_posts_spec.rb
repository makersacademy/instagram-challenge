require "rails_helper"

RSpec.feature "Timeline", :type => :feature do
  scenario "Create posts and view them" do
    sign_up("myusername", "myemail@example.com", "password123")

    create_post("first", "firsturl")
    create_post("second", "secondurl")

    expect(page).to have_text("first")
    expect(page).to have_text("second")
  end
end
