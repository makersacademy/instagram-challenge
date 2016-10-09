def add_post(caption, image)
  visit '/posts'
  click_link 'Add a post'
  fill_in 'post_caption', with: caption
  page.attach_file('post_image', Rails.root + "public/images/#{image}")
  click_button 'Add'
end

def edit_post(caption)
  click_link 'Edit'
  fill_in 'post_caption', with: caption
  click_button 'Update'
end

def sign_up
  visit '/'
  click_link 'Sign up'
  fill_in 'user_username', with: 'abimcp'
  fill_in 'user_email', with: 'abi@abi.com'
  fill_in 'user_password', with: '123456'
  fill_in 'user_password_confirmation', with: '123456'
  click_button 'Sign up'
end

def add_comment(content)
  visit '/posts'
  click_link 'Comment'
  fill_in 'comment_content', with: content
  click_button 'Comment'
end
