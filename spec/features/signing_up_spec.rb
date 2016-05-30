feature "user sign up" do

  context "when valid credentials" do
    scenario "sign up is successful, display username" do
      sign_up
      expect(page).to have_link("Logout")
      expect(page).not_to have_link("Login")
      expect(page).not_to have_link("Sign up")
      expect(page).to have_content("myUsername")
      expect(page).to have_link("New")
      expect(page).to have_content("Welcome! You have signed up successfully.")
    end
  end

  context "when invalid credentials" do
    scenario "sign up with short username" do
      sign_up("my")
      error = "Username is too short (minimum is 4 characters)"
      expect(page).to have_content error
    end

    scenario "sign up with long username" do
      sign_up("myVeryVeryLongUsername")
      error = "Username is too long (maximum is 16 characters)"
      expect(page).to have_content error
    end

    scenario "sign up with blank username" do
      sign_up(nil)
      expect(page).to have_content "Username can't be blank"
    end
  end
end
