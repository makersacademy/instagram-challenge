module SessionHelpers
  def sign_up
    fill_in 'User name', with: 'monkey123'
    fill_in 'Email', with: 'monkey@jungle.com'
    fill_in 'Password', with: '12345678', match: :first
    fill_in 'Password confirmation', with: '12345678'
    click_button('Sign up')
  end

  def sign_in
    fill_in('Email', with: 'monkey@jungle.com')
    fill_in('Password', with: '12345678')
    click_button('Log in')
  end
end
