def caption_text
  'Fluffy kittens!'
end

def post_photo(caption = caption_text)
  visit '/posts/new'
  fill_in 'Caption', with: caption
  click_button 'Post'
end