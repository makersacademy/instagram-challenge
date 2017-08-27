module UserHelpers
  def sign_up(username: "dangermouse",
              email: "danger@mouse.com",
              password: "penfoldshush",
              password_confirmation: "penfoldshush")
    visit "/users/sign_up"
    fill_in 'user_username', with: username
    fill_in 'user_email' , with: email
    fill_in 'user_password', with: password
    fill_in 'user_password_confirmation', with: password_confirmation
    click_button('Sign up')
  end

  def logout
    click_link("Logout")
  end

  def sign_in(email: "danger@mouse.com",
              password: "penfoldshush")
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
