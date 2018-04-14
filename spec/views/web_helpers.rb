def add_picture
  visit('/pictures/new')
  fill_in 'picture[imgURL]', with: "https://images.pexels.com/photos/440731/pexels-photo-440731.jpeg?h=350&auto=compress&cs=tinysrgb"
  fill_in 'picture[description]', with: 'Beautiful field'
  click_button 'Create Picture'
end

def add_picture_and_comment
  add_picture
  visit('/pictures/1')
  click_link 'Add Comment'
  fill_in 'comment[name]', with: "Name of commenter"
  fill_in 'comment[comment]', with: "Commenty Text"
  click_button 'Create Comment'
end

def sign_up_user
  visit('/')
  click_link 'Sign up'
  fill_in 'user[email]', with: "email@gmail.com"
  fill_in 'user[password]', with: "password"
  fill_in 'user[password_confirmation]', with: "password"
  click_button 'Sign up'
end
