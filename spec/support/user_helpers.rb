module UserHelpers
  def sign_up(username: "dangermouse",
              email: "danger@mouse.com",
              password: "penfoldshush",
              password_confirmation: "penfoldshush")
    user = create(:user, username: username,
                  email: email,
                  password: password,
                  password_confirmation: password_confirmation)
    sign_in(email: user.email, password: user.password)
  end

  def logout
    click_link("Logout")
  end

  def sign_in(email: "danger@mouse.com",
              password: "penfoldshush")
    visit "/"
    click_link("Login")
    fill_in 'user_email' , with: email
    fill_in 'user_password', with: password
    click_button 'Log in'
  end

  def follow(username: "dangermouse")
    visit "/profiles/#{username}"
    click_button "Follow"
  end
end
