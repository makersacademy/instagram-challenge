def sign_up(email, username)
	visit('/')
	click_link('Sign up')
	fill_in('Email', with: email)
	#fill_in('Username', with: username)
	fill_in('Password', with: 'testtest')
	fill_in('Password confirmation', with: 'testtest')
	click_button('Sign up')
end