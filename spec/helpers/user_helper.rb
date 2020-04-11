module UserHelper

  def sign_up
    visit '/users/sign_up'
    fill_in 'user_email', with: 'ruby@rails.com'
    fill_in 'user_password', with: '123456'
    fill_in 'user_password_confirmation', with: '123456'
    click_button 'Sign up'
  end

  def login_as(user)
    visit '/users/sign_in'
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Log in'
  end

end
