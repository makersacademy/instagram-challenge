def post_picture
  visit pictures_path
  click_link 'Post a picture'
  fill_in 'Title', with: 'My Picture'
  click_button 'Post'
end

def post_picture_with_image
  visit pictures_path
  click_link 'Post a picture'
  fill_in 'Title', with: 'My Picture'
  click_button 'Post'
end
