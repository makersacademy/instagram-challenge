def login
  visit("/users/sign_in")
  within(:css, 'form.new_user') do
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Log in'
  end
end

def sign_up
		visit('/users/sign_up')
		within(:css, 'form.new_user') do
		fill_in 'user_name', with: 'Oscar'
		fill_in 'user_username', with: 'oscarwao'
		fill_in 'user_bio', with: 'The next J.R.R. Tolkien'
		fill_in 'user_email', with: 'oscar@wao.com'
		fill_in 'user_password', with: '123456'
		fill_in 'user_password_confirmation', with: '123456'
		click_button 'Sign up'
	end
end
