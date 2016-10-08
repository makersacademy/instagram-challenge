def sign_in(email: "test@test.com", password: "123456")
  visit('/')
  click_link('Log in')
  fill_in('user_email', with: email)
  fill_in('user_password', with: password)
  click_button('Log in')
end

def sign_out
  click_link('Log out')
end

def visit_post(post)
  visit("/posts")
  click_link(post.description)
end

def visit_post_and_add_comment(comment: "nice photo, like it", post: )
  visit_post(post)
  click_link "add comment"
  add_comment(comment: comment, post: post)
end

def add_comment(comment: "nice photo, like it", post: )
  fill_in('comment_field', with: comment)
  click_button "Add comment"
end
