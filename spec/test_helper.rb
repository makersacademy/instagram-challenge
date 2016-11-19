def caption_text
  'Fluffy kittens!'
end

def post_photo(caption = caption_text)
  visit '/posts/new'
  attach_file(:post_image, File.absolute_path('../kittens.jpg'))
  fill_in 'Caption', with: caption
  click_button 'Post'
end