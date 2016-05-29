feature "login and logout" do
  before do
    user = create :user
  end
  feature "login" do
    context "when correct credentials" do
      scenario "login correctly" do
        log_in
        expect(page).to have_content("amynic")
        expect(page).to have_content("Signed in successfully.")
      end
    end

    context "when credentials are incorrect" do
      scenario "do not login if wrong password" do
        log_in({email: "amy@gmail.com", password: "wrong password"})
        expect(page).to have_content("Invalid Email or password")
      end

      scenario "do not login if wrong email" do
        log_in({email: "incorrect@gmail.com", password: "testtest"})
        expect(page).to have_content("Invalid Email or password")
      end
    end
  end

  feature "logout" do
    scenario "logout" do
      log_in
      click_link "Logout"
      expect(page).not_to have_link "Logout"
      expect(page).to have_link "Login"
      expect(page).to have_content("You need to sign in or sign up before continuing")
    end
  end
end
