def sign_up
	visit '/pictures'
	click_link 'Sign up'
	fill_in :user_email, with: 'a@a.com'
	fill_in :user_password, with: '12345678'
	fill_in :user_password_confirmation, with: '12345678'
	click_button 'Sign up'
end