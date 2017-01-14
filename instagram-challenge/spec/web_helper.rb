def add_post
  visit '/posts'
  click_link "Post a new photo"
  fill_in "Description", with: "Beach life"
  attach_file("post_image", "#{Rails.root}/spec/beach.jpg")
  click_button "Create Post"
end
