def make_post(title: 'My First Pic',
              image: "spec/files/images/poo.jpg",
              caption: 'a random picture')
  visit '/posts'
  click_link 'Make a Post'
  fill_in 'Title', with: title
  attach_file("Image", "#{image}")
  fill_in 'Caption', with: caption
  click_button 'Create Post'
end

def make_post_without_image(title: 'My First Pic',
              caption: 'a random picture')
  visit '/posts'
  click_link 'Make a Post'
  fill_in 'Title', with: title
  fill_in 'Caption', with: caption
  click_button 'Create Post'
end

def comment(comment: "why upload a picture of poo?")
  visit '/'
  click_link 'Comment'
  fill_in "Comment", with: comment
  click_button 'Submit'
end

def sign_user_up(email: 'test@example.com')
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: email)
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end