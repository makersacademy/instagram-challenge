require 'rails_helper'

RSpec.feature "Profile Pages", type: :feature do
  let(:user) { User.create(name: "Admin", username: "MrAdmin", email: "test@example.com", password: "password") }

  scenario "User can post an image" do
    sign_up
    visit "/users/#{user.id}"
    expect(page).to have_content("Username: MrAdmin")
  end

  scenario "User pages display 0 posts for new user" do
    sign_up
    visit "/users/#{user.id}"
    expect(page).to have_content("Posts: 0")
  end

  scenario "User pages display 0 likes for new user" do
    sign_up
    visit "/users/#{user.id}"
    expect(page).to have_content("Likes: 0")
  end
end
