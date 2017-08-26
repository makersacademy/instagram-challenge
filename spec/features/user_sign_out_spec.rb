RSpec.feature "Signing out" do
  it "allows a user to sign out" do
    sign_up
    click_link("Logout")
    expect(page).to have_content "You need to sign in or sign up before continuing"
  end
end
