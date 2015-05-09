module UserHelpers

  def sign_up_and_sign_in options = {}
    visit '/'
    click_link('Sign up')
    fill_in('Email', with: options.fetch(:email, 'test@example.com'))
    fill_in('Password', with: options.fetch(:password, 'testtest'))
    fill_in('Password confirmation', with: options.fetch(:password_confirmation, 'testtest'))
    click_button('Sign up')
  end

  def sign_out
    visit '/'
    click_link('Sign out')
  end

  def sign_in
    visit '/'
    click_link 'Sign in'
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: 'testtest'
    click_button 'Log in'
  end
end
