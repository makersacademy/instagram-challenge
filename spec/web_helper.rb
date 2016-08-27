def sign_up(name)
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: "#{name}@example.com")
  fill_in('Password', with: "#{name}#{name}")
  fill_in('Password confirmation', with: "#{name}#{name}")
  click_button('Sign up')
end

def create_post
  visit '/posts'
  click_link 'Add a post'
  fill_in 'Message', with: 'This is my first real message'
  click_button 'Create Post'
end
