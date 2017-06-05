def user_makes_post
  visit "/posts"
  find('#new-post').click
  fill_in :caption, with: "Hello, world!"
  attach_file('post_image', Rails.root + 'spec/support/assets/dog.jpg')
  click_button "Post picture!"
end

def user_makes_bad_post
  visit "/posts"
  find('#new-post').click
  fill_in :caption, with: "No photo!"
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
