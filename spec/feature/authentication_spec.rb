feature "Authentication" do
  scenario "Sign up a new user" do
    visit "/"
    click_link "Sign up"
    fill_in "Email", with: "test@test.com"
    fill_in "Password", with: "sixcharacters"
    fill_in "Password confirmation", with: "sixcharacters"
    click_button "Sign up"
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end
end
