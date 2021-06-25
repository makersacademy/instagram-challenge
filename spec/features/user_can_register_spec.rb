describe("Registering a new user", type: :feature) do
  context("with correct credentials") do 
    it("redirects to the login page") do
      visit "/users/new"
      fill_in "First name", with: "John"
      fill_in "Last name", with: "Doe"
      fill_in "Email", with: "John@example.com"
      fill_in "Password", with: "example", match: :first
      fill_in "Password confirmation", with: "example"
      click_button "Submit"
      # change to redirect to login when sessions set up
      expect(current_path).to eq("/users/new")
    end
  end

  context("with incorrect credentials") do
    it("stays on the same page and displays error messages") do
      visit "/users/new"
      fill_in "First name", with: ""
      fill_in "Last name", with: ""
      fill_in "Email", with: "John&examplecom"
      fill_in "Password", with: "exa", match: :first
      fill_in "Password confirmation", with: "exap"
      click_button "Submit"

      expect(page).to have_content("First name can't be blank")
      expect(page).to have_content("Last name can't be blank")
      expect(page).to have_content("Email is invalid")
      expect(page).to have_content("Password is too short (minimum is 6 characters)")
      expect(page).to have_content("Password confirmation doesn't match Password")
    end
  end
end
