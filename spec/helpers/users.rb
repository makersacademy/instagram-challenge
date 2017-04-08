module UserHelpers

  def user_sign_in(email = 'test@example.com', password = 'testtest')
    visit('/users/sign_in')
    fill_in('Email', with: email)
    fill_in('Password', with: password)
    click_button('Log in')
  end

  def user_sign_up(email = 'test@example.com', password = 'testtest', password_confirmation = 'testtest')
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: email)
    fill_in('Password', with: password)
    fill_in('Password confirmation', with: password_confirmation)
    click_button('Sign up')
  end

end
