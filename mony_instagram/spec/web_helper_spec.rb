def sign_up
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: 'test@tmail.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end

def another_sign_up
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: 'tk@gma.com')
  fill_in('Password', with: 'tttttt')
  fill_in('Password confirmation', with: 'tttttt')
  click_button('Sign up')
end

def post_a_photo(caption_message)
  user = User.create(email: 'test@test.com')
  @sunset = user.photos.new(caption: caption_message, user_id: user.id)
  @sunset.save
end

def sign_out
  visit('/')
  click_link('Sign out')
end
