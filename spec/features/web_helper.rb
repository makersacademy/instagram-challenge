def sign_up
	visit('/posts')
	click_link('Sign up')
	fill_in("Email", with: "bob@example.com")
	fill_in("Password", with: "123456789")
	fill_in("Password confirmation", with: "123456789")
	click_button("Sign up")
end

def create_post
	sign_up
	click_link 'Post a photo'
	fill_in 'Name', with: 'Freddie'
	click_button 'Upload image'
end
