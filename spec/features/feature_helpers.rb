
def sign_up(username: "jking", email: "jking@gmail.com", password: "123456", password_confirmation: "123456")
  click_on "Sign Up"
  fill_in 'user_username', with: username
  fill_in 'user_email', with: email
  fill_in 'user_password', with: password
  fill_in 'user_password_confirmation', with: password_confirmation
  click_button 'Sign up'
end

def sign_out
  click_on "Sign Out"
end

def log_in(email: "jking@gmail.com", password: "123456")
  click_on "Sign In"
  fill_in 'user_email', with: email
  fill_in 'password_confirmation', with: password
  click_button "Log in"
end


def create_pic(caption: "test caption")
  click_on "Post Picture"
  fill_in "picture_caption", with: caption
  page.attach_file('picture_image', Rails.root + 'public/images/surf.jpg')
  click_on "Post"
end

def leave_comment(comment: "a selfie a day keeps contentment at bay")
  click_on "Leave a comment"
  fill_in "comment_content", with: comment
  click_on "Comment"
end
