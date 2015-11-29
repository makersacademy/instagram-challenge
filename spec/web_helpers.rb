def add_comment
	click_link 'Comment'
	fill_in 'Message', with: 'Nice Photo'
	click_button 'Send'
end

def add_post
	visit ('/posts')
	click_link 'Add Post'
	fill_in 'Name', with: 'Sunset'
	click_button 'Create Post'
end

def sign_up(email, password)
	visit('/')
  click_link('Sign Up')
  fill_in('Email', with: email)
  fill_in('Password', with: password)
  fill_in('Password confirmation', with: password)
  click_button('Sign up')
end