def sign_up_sam
  visit '/'
  click_on 'Sign up'
  fill_in 'first_name', with: 'Sam'
  fill_in 'last_name', with: 'Folo'
  fill_in 'email', with: 'sam@example.com'
  fill_in 'password', with: '1234icecream'
  fill_in 'password_confirmation', with: '1234icecream'
  click_on 'Submit'
end

def post_picture_of_breakfast
  click_on 'New Post'
  attach_file('image', 'spec/images/avocado-on-toast.jpg')
  fill_in 'description', with: '#blessed'
  click_on 'Share'
end

def post_picture_of_dog
  click_on 'New Post'
  attach_file('image', 'spec/images/some-dog.jpg')
  fill_in 'description', with: '#dogs'
  click_on 'Share'
end
