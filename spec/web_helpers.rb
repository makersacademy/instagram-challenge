def post_picture_with_image
  visit pictures_path
  click_link 'Post a picture'
  fill_in 'Title', with: 'Bird'
  attach_file 'picture[image]', 'spec/assets/images/bird.png'
  click_button 'Post'
end

def visit_picture
  image_with_link = find(:xpath, "//a[contains(@text, 'Bird')]")
  image_with_link.click
end

def edit_title
  visit picture_path(pic)
  click_link 'Edit'
  fill_in 'Title', with: 'Better title'
  click_button 'Update'
end

def leave_comment
  click_link 'Comment'
  fill_in 'comment_thoughts', with: 'Beautiful picture!'
  click_button 'Comment'
end
