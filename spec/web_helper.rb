def sign_up(email:'test@example.com', password:'testtest', password_confirmation: 'testtest')
  visit '/'
  click_link 'Sign Up'
  fill_in('* Email', with: email)
  fill_in('* Password', with: password)
  fill_in('* Password confirmation', with: password_confirmation)
  click_button('Sign up')
end

def post_with_image
  click_link 'New Post'
  fill_in 'Title', with: 'Jonny Bravo'
  fill_in 'Description', with: 'This is a cool pic'
  attach_file('post_image', "#{Dir.pwd}/spec/features/test_images/jonny.png")
  click_button 'Create Post'
end
