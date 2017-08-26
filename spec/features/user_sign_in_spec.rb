RSpec.feature "Signing in" do
  it "allows users to sign in" do
    sign_up
    logout
    click_link("Login")
    fill_in 'user_email' , with: "danger@mouse.com"
    fill_in 'user_password', with: "penfoldshush"
    click_button 'Log in'
    expect(page).to have_content "Signed in successfully"
  end
end
