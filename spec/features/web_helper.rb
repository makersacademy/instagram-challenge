def create_post
  click_on 'New Post'
  fill_in :post_desc, with: 'Description'
  page.attach_file("post_image", "app/assets/images/crabbo.jpg")
  click_on 'Create Post'
end

def sign_up
  visit '/'
  click_on 'Sign up'
  fill_in :user_email, with: "joebloggs@hotmail.co.uk"
  fill_in :user_password, with: 'bloggs'
  fill_in :user_password_confirmation, with: 'bloggs'
  click_on 'Sign up'
end
