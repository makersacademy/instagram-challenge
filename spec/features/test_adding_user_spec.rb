describe 'Posts page' do
  feature "user can sign up and be logged in" do
    visit '/users/sign_up'
    fill_in "user_email", with: "test@yahoo.com"
    fill_in "user_password", with: "password"
    fill_in "user_password_confirmation", with: "password"
    click_button "Sign up"
    expect(page).to have_content("Logged in as test@gmail.com")
  end
end
