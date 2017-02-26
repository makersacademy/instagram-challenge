module WebHelper
  def sign_in(email, password)
    visit '/'
    click_link 'Sign in'
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Log in'
  end
end
