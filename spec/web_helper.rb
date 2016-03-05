def signup
  visit('/')
  click_link 'Sign up'
  fill_in('Email', with: 'bob@bob.com')
  fill_in('Password', with: 'password')
  fill_in('Password confirmation', with: 'password')
  click_button 'Sign up'
end

def post_pic
  click_link('Add a picture')
  fill_in('Description', with: 'Great Leader')
  attach_file 'post[image]', Rails.root.join('spec','fixtures','kimj.png')
  click_button('Create Post')
end 
