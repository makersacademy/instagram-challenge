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
  find('#new-post').click
  fill_in :caption, with: "Hello, world!"
  attach_file('post_image', Rails.root + 'spec/support/assets/dog.jpg')
  click_button "Post picture!"
end

def user_makes_filtered_post(filter)
  visit "/posts"
  find('#new-post').click
  find('#' + filter).click
  fill_in :caption, with: "Hello, world!"
  attach_file('post_image', Rails.root + 'spec/support/assets/dog.jpg')
  click_button "Post picture!"
end

def user_makes_different_post
  visit "/posts"
  find('#new-post').click
  fill_in :caption, with: "Hello again!"
  attach_file('post_image', Rails.root + 'spec/support/assets/dog.jpg')
  click_button "Post picture!"
end
