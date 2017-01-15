def post_photo
  visit '/photos'
  click_link 'Post a photo'
  attach_file('photo[image]', 'spec/pictures/my_lunch.jpg')
  fill_in 'Caption', with: 'My Lunch'
  click_button 'Post'
end

def sign_up(email: 'george@example.com', password: '123456')
  visit '/'
  click_link 'Sign up'
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  fill_in 'Password confirmation', with: password
  click_button 'Sign up'
end
