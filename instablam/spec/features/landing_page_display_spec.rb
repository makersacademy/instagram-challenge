feature "Landing page display" do
  scenario "sign in/up not displayed when logged in" do
    sign_up
    visit'/'
    expect(page).not_to have_content("Sign In")
  end

  scenario "sign in/up displayed when not logged in" do
    visit'/'
    expect(page).to have_content("Sign In")
  end
end
