require_relative './helpers/photo_feature_helpers_spec'

RSpec.feature "User Log In", type: :feature do

  scenario "Users can Log in" do
    sign_up
    log_out
    log_in
    expect(page).to have_content("Welcome to Simstagram Test_User!")
  end

  scenario "Can't log in if password is wrong" do
    sign_up
    log_out
    log_in("test@email.com", "wrongpassword")
    expect(current_path).to eq("/session/new")
  end

end