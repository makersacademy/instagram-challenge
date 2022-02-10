require 'rails_helper'

# Includes notes to aid learning

RSpec.feature "a user can login", type: :feature do
  
  def log_in_as(user)
    visit new_user_session_path # the login page
    fill_in("user_email", with: user.email)
    fill_in("user_password", with: user.password)
    click_button("Log in")
  end  

  let(:user) { User.create(email: "test2@example.com", password: "password") }

  it "allows a logged in user to visit the new post route" do
    # use the standard devise `login`` route and login form to simulate heading to the login page
    log_in_as(user)
    visit new_picture_path
    expect(current_path).to eq(new_picture_path)
  end

  it "does not allow a user who is not logged in to visit the new post route" do
    visit new_picture_path
    # standard devise behaviour is for non-logged in users to be redirected to the login page
    expect(current_path).to eq(user_session_path)
  end
end

