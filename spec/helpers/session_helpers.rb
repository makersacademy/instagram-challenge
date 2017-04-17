module SessionHelpers
  def sign_up(user)
    fill_in 'User name', with: user.user_name
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', user.password
    click_button('Sign up')
  end

  def sign_in(user)
    fill_in('Email', with: user.email)
    fill_in('Password', with: user.password)
    click_button('Log in')
  end
end
