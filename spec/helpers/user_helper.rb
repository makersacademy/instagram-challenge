  def sign_up_as(user)
    visit '/users/sign_up'
    fill_in("Email", with: user.email)
    fill_in('Password', with: user.password)
    fill_in('Password confirmation', with: user.password_confirmation)
    click_button('Sign up')
    p current_path
    visit '/restaurants'
  end

  def sign_in_as(user)
    visit '/users/sign_in'
    fill_in('Email', with: user.email)
    fill_in('Password', with: user.password)
    click_button 'Sign in'
  end