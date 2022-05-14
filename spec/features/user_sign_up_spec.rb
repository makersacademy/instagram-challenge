require 'rails_helper'

RSpec.feature "UserSignUps", type: :feature do 

#   def sign_up_as(user) 
#     visit new_user_registration_path
#     fill_in("user_email", with: user.email)
#     fill_in("user_password", with: user.password)
#     click_button("Sign up")
#   end

  # let(:user) { User.create(email: "test36@example.com", password: "password") }

  it "a user can sign up" do
    visit new_user_registration_path
    fill_in("user_email", with: "test36@example.com")
    fill_in("user_password", with: "password")
    click_button("Sign up")
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end
end
