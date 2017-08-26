RSpec.feature "Signing up" do
  it "allows a user to sign up" do
    visit '/users/sign_up'
    fill_in 'user_username', with: "dangermouse"
    fill_in 'user_email' , with: "danger@mouse.com"
    fill_in 'user_password', with: "penfoldshush"
    fill_in 'user_password_confirmation', with: "penfoldshush"
    click_button 'Sign up'
    expect(page).to have_content "Welcome! You have signed up successfully."
  end
end
