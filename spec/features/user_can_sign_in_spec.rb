describe("Signing in", type: :feature) do
  before(:each) do
    user = User.new(first_name: "John", last_name: "Doe", email: "example@test.com", password: "example", password_confirmation: "example")
    user.save
    visit sessions_new_path 
  end 
  context("With correct details") do
    it("redirects to users profile") do
      fill_in "Email", with: "example@test.com"
      fill_in "Password", with: "example"
      click_button "Sign in"
      expect(page).to have_content("Hello, John")
    end
  end
end
