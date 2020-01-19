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

def log_in_sam
  visit '/'
  click_on 'Log in'
  fill_in 'email', with: 'sam@example.com'
  fill_in 'password', with: '1234icecream'
  click_on 'Log in'
end

def sign_up_elodie
  visit '/'
  click_on 'Sign up'
  fill_in 'first_name', with: 'Elodie'
  fill_in 'last_name', with: 'Laurent'
  fill_in 'email', with: 'elodie@example.com'
  fill_in 'password', with: '1234icecream'
  fill_in 'password_confirmation', with: '1234icecream'
  click_on 'Submit'
end

def sign_up_leina
  visit '/'
  click_on 'Sign up'
  fill_in 'first_name', with: 'Leina'
  fill_in 'last_name', with: 'Rele'
  fill_in 'email', with: 'leina@example.com'
  fill_in 'password', with: '1234icecream'
  fill_in 'password_confirmation', with: '1234icecream'
  click_on 'Submit'
end

def post_picture_of_breakfast
  click_on 'New Post'
  attach_file 'image', 'spec/images/avocado-on-toast.jpg'
  fill_in 'description', with: '#blessed'
  click_on 'Share'
end

def post_picture_of_dog
  click_on 'New Post'
  attach_file 'image', 'spec/images/some-dog.jpg'
  fill_in 'description', with: '#dogs'
  click_on 'Share'
end
