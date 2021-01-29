require "rails_helper"

RSpec.feature "SignUp", type: :feature do
  scenario "Can sign up and details are saved" do
    visit '/'
    expect(page).to have_button("Sign Up")
    fill_in "Username", with: "Username"
    fill_in "Email", with: "User@example.com"
    fill_in "Password", with: "Password"
    click_button "Sign Up"
    expect(current_path).to eq "/posts"

    user = User.find_by(username: "Username")

    expect(user).to be
    expect(user.email).to eq "User@example.com"
    expect(user.password).not_to eq "Password"
  end
end
