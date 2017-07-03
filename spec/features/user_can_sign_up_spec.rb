require_relative './helpers/photo_feature_helpers_spec'

RSpec.feature "User Signup", type: :feature do

  scenario "Users can Sign Up" do
    sign_up
    expect(page).to have_content("Welcome to Simstagram Test_User!")
  end

  scenario "Can't sign up if password doesn't match confirmation" do
    sign_up("Test_User", "test@email.com", "password", "wrongpassword")
    expect(current_path).to eq("/users/new")
  end

  scenario "Can't sign up without a name" do
    sign_up(nil, "test@email.com", "password", "wrongpassword")
    expect(current_path).to eq("/users/new")
  end

  scenario "Can't sign up without an email" do
    sign_up("Test_User", nil, "password", "wrongpassword")
    expect(current_path).to eq("/users/new")
  end

  scenario "Can't sign up without a password" do
    sign_up("Test_User", "test@email.com", nil, nil)
    expect(current_path).to eq("/users/new")
  end

end