RSpec.feature "Signing in" do
  it "allows users to sign in" do
    dangermouse = create(:user)
    visit "/"
    click_link("Login")
    fill_in 'user_email' , with: dangermouse.email
    fill_in 'user_password', with: dangermouse.password
    click_button 'Log in'
    expect(page).to have_content "Signed in successfully"
  end
end
