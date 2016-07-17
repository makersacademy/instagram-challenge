def sign_up(email: 'poster@example.com', password: 'testtest', password_confirmation: 'testtest' )
	visit '/'
	click_link('Sign up')
	fill_in('Email', with: email)
	fill_in('Password', with: password)
	fill_in('Password confirmation', with: password_confirmation)
	click_button('Sign up')
end


def sign_in(email: 'poster@example.com', password: 'testtest')
	visit '/'
	click_link('Sign in')
	fill_in('Email', with: email)
	fill_in('Password', with: password)
	click_button('Sign in')
end

def add_post
	visit '/'
	click_on 'Add a post!'
	fill_in 'post_description', with: 'When we were at Germany!'
	attach_file('post_image', Rails.root + "spec/fixtures/test_image.jpg")
	click_on 'Create Post'
end
