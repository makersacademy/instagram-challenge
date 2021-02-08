require "rails_helper"

RSpec.feature "SignUp", type: :feature do
  scenario "Can sign up and details are saved" do
    visit '/'
    within '.header' do
      click_link "Sign Up"
    end
    expect(page).to have_button("Sign Up")
    fill_in "Username", with: "Username"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "Password"
    fill_in "user_password_confirmation", with: "Password"
    click_button "Sign Up"
    expect(current_path).to eq "/posts"

    user = User.find_by(username: "Username")

    expect(user.username).to eq "Username"
    expect(user.email).to eq "user@example.com"
    expect(user.password).not_to eq "Password"
  end

  scenario "password is hidden" do
    visit '/'
    within '.header' do
      click_link "Sign Up"
    end
    fill_in "Username", with: "Username"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "hidden"
    expect(page).to_not have_content("hidden")
    fill_in "user_password_confirmation", with: "hidden"
    expect(page).to_not have_content("hidden")
  end

  scenario "cannot sign up if username not unique" do
    user = User.create(username: "username", email: "user1@example.com", password: "password")
    visit '/'
    within '.header' do
      click_link "Sign Up"
    end
    fill_in "Username", with: "username" #duplicate
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "hidden"
    fill_in "user_password_confirmation", with: "hidden"
    click_button "Sign Up"
    expect(page).to have_content("Sign up")
  end

  scenario "cannot sign up if username not unique" do
    user = User.create(username: "username", email: "user1@example.com", password: "password")
    visit '/'
    within '.header' do
      click_link "Sign Up"
    end
    fill_in "Username", with: "username2"
    fill_in "Email", with: "user1@example.com" #duplicate
    fill_in "Password", with: "hidden"
    fill_in "user_password_confirmation", with: "hidden"
    click_button "Sign Up"
    expect(page).to have_content("Sign up")
  end

end
