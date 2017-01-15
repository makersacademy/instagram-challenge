def post_photo
  visit '/photos'
  click_link 'Post a photo'
  attach_file('photo[image]', 'spec/pictures/my_lunch.jpg')
  fill_in 'Caption', with: 'My Lunch'
  click_button 'Post'
end

def sign_up
  visit '/'
  click_link 'Sign up'
  fill_in 'Email', with: 'george@example.com'
  fill_in 'Password', with: '123456'
  fill_in 'Password confirmation', with: '123456'
  click_button 'Sign up'
end
