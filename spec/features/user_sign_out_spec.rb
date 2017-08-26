RSpec.feature "Signing out" do
  it "allows a user to sign out" do
    sign_up
    click_link("Logout")
    expect(page).to have_content "Signed out successfully"
  end
end
