def create_post
  visit('/posts')
  click_link('Create a post')
  # attach_file("post_image", "spec/photo1.jpg")
  fill_in('Description', with: 'I love summer')
  click_button('Create Post')
end
