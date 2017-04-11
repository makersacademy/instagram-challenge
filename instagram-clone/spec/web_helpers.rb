def upload_post
  visit('/posts')
  click_link('Create a post')
  attach_file("post_image", "spec/sunset.jpg")
  fill_in('Description', with: 'Beautiful view')
  click_button('Create Post')
end
