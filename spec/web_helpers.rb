def post_picture_with_image
  visit pictures_path
  click_link 'Post a picture'
  fill_in 'picture_title', with: 'Bird'
  attach_file 'picture[image]', 'spec/assets/images/bird.png'
  click_button 'Post'
end

def visit_picture
  image_with_link = find(:xpath, "//a[contains(@text, 'Bird')]")
  image_with_link.click
end

def edit_title
  visit picture_path(pic)
  click_link 'Edit'
  fill_in 'picture_title', with: 'Better title'
  click_button 'Update'
end

def leave_comment
  click_link 'Comment'
  fill_in 'comment_thoughts', with: 'Beautiful picture!'
  click_button 'Comment'
end

def sign_up_jinis
  visit root_path
  click_link 'Sign up'
  fill_in 'Username', with: 'jinis'
  fill_in 'Email', with: 'misa2@misa.com'
  fill_in 'Password', with: '123456789'
  fill_in 'Password confirmation', with: '123456789'
  click_button 'Sign up'
end
