def sign_up
  visit "/"
  fill_in 'user[username]', with: 'MrAdmin'
  fill_in 'user[name]', with: 'Admin'
  fill_in 'user[email]', with: 'admin@exchangeagram.com'
  fill_in 'user[password]', with: 'password'
  find('.submit-field input').click
end

def user_makes_post
  visit "/posts"
  click_link "New post"
  fill_in "Caption", with: "Hello, world!"
  click_button "Submit"
end
