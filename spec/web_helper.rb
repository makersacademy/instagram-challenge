def sign_in_helper(email: 'foo@bar.com', password: '00000000')
	visit '/'
	click_link 'Sign In'
	fill_in 'Email', with: email
	fill_in 'Password', with: password
	click_button 'Log in'
end

def sign_up_helper(name: 'Foo Bar', email: 'foo@bar.com', password: '00000000', password_confirmation: '00000000')
	visit '/'
	click_link 'Sign Up'
	fill_in 'Name', with: name
	fill_in 'Email', with: email
	fill_in 'Password', with: password
	fill_in 'Password confirmation', with: password_confirmation
	click_button 'Sign up'
end

def create_picture
	visit '/'
	click_link 'Upload a picture'
	fill_in 'Title', with: 'Me'
	attach_file('Image', Rails.root + "spec/fixtures/bart-simpson-01.gif")
	click_button 'Upload'
end