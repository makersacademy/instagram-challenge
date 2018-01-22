def create_post
  click_on 'New Post'
  fill_in :post_desc, with: 'Description'
  page.attach_file("post_image", "app/assets/images/crabbo.jpg")
  click_on 'Create Post'
end

def sign_up(email: "joebloggs@hotmail.co.uk", password: 'bloggs', password_conf: 'bloggs')
  visit '/'
  click_on 'Sign up'
  fill_in :user_email, with: email
  fill_in :user_password, with: password
  fill_in :user_password_confirmation, with: password_conf
  click_on 'Sign up'
end

def sign_in(email: "joebloggs@hotmail.co.uk", password: 'bloggs')
  fill_in :user_email, with: email
  fill_in :user_password, with: password
  click_on "Log in"
end
