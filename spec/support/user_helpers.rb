module UserHelpers
  def sign_up
    visit '/users/sign_up'
    fill_in 'user_username', with: "dangermouse"
    fill_in 'user_email' , with: "danger@mouse.com"
    fill_in 'user_password', with: "penfoldshush"
    fill_in 'user_password_confirmation', with: "penfoldshush"
    click_button('Sign up')
  end

  def logout
    click_link("Logout")
  end

  def sign_in
    click_link("Login")
    fill_in 'user_email' , with: "danger@mouse.com"
    fill_in 'user_password', with: "penfoldshush"
    click_button 'Log in'
  end
end
