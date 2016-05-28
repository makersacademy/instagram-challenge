feature "user sign up" do

  context "when valid credentials" do
    scenario "sign up is successful, display username" do
      sign_up
      expect(page).to have_link("Logout")
      expect(page).not_to have_link("Login")
      expect(page).not_to have_link("Sign up")
      expect(page).to have_content("myUsername")
    end
  end

  context "when invalid credentials" do
    scenario "sign up with short username" do
      sign_up("my")
      expect(page).to have_content "Username is too short (minimum is 4 characters)"
    end

    scenario "sign up with long username" do
      sign_up("myVeryVeryLongUsername")
      expect(page).to have_content "Username is too long (maximum is 16 characters)"
    end

    scenario "sign up with blank username" do
      sign_up(nil)
      expect(page).to have_content "Username can't be blank"
    end
  end
end

feature "login" do
  before do
    sign_up
    click_link "Logout"
  end
  context "when correct credentials" do
    scenario "login correctly" do
      log_in
      expect(page).to have_content("myUsername")
    end
  end

  context "when credentials are incorrect" do
    scenario "do not login if wrong password" do
      log_in("test@example.com", "wrong password")
      expect(page).to have_content("Invalid Email or password")
    end

    scenario "do not login if wrong email" do
      log_in("invalidEmailAddress")
      expect(page).to have_content("Invalid Email or password")
    end
  end
end

feature "logout" do
  scenario "logout" do
    sign_up
    click_link "Logout"
    expect(page).not_to have_link "Logout"
    expect(page).to have_link "Login"
  end
end

def sign_up(username = "myUsername")
  visit("/")
  click_link("Sign up")
  fill_in("Username", with: username)
  fill_in("Email", with: "test@example.com")
  fill_in("Password", with: "testtest")
  fill_in("Password confirmation", with: "testtest")
  click_button("Sign up")
end

def log_in(email = "test@example.com", password = "testtest")
  visit("/")
  click_link "Login"
  fill_in("Email", with: email)
  fill_in("Password", with: password)
  click_button("Log in")
end
