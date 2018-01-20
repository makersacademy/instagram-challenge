def create_post
  click_on 'New Post'
  fill_in :post_desc, with: 'Description'
  page.attach_file("post_image", "app/assets/images/crabbo.jpg")
  click_on 'Create Post'
end
