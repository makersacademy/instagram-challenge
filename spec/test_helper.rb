def caption_text
  'Fluffy kittens!'
end

def comment_text
  'Cool pic!'
end

def new_comment_text
  'Super cool pic!'
end

def post_photo(caption = caption_text)
  visit '/posts/new'
  attach_file(:post_image, File.absolute_path('../kittens.jpg'))
  fill_in 'Caption', with: caption
  click_button 'Post'
end

def leave_comment
  click_link caption_text
  fill_in 'Comment', with: comment_text
  click_button 'Comment!'
end