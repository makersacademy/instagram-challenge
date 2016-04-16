def post_picture_with_image
  visit pictures_path
  click_link 'Post a picture'
  fill_in 'Title', with: 'Bird'
  attach_file 'picture[image]', 'spec/assets/images/bird.png'
  click_button 'Post'
end

def edit_title
  visit picture_path(pic)
  click_link 'Edit'
  fill_in 'Title', with: 'Better title'
  click_button 'Update'
end
