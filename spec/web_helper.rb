def add_post(caption, image)
  visit '/posts'
  click_link 'Add a post'
  fill_in 'Caption', with: caption
  page.attach_file('post_image', Rails.root + "public/images/#{image}")
  click_button 'Add'
end

def edit_post(caption)
  click_link 'Edit'
  fill_in 'Caption', with: caption
  click_button 'Update'
end

def sign_up
  visit '/'
  click_link 'Sign up'
  fill_in 'Email', with: 'abi@abi.com'
  fill_in 'Password', with: '123456'
  fill_in 'Password confirmation', with: '123456'
  click_button 'Sign up'
end
