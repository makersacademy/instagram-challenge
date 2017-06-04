require 'rails_helper'

RSpec.feature "Routing", type: :feature do
  let(:user) { User.create(name: "Admin", username: "MrAdmin", email: "test@example.com", password: "password") }

  scenario "User can post an image" do
    sign_up
    visit "/users/#{user.id}"
    expect(page).to have_content("Username: MrAdmin")
  end
end
