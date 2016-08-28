def create_mewment(caption, file_name)
  visit('/mewments')
  click_link 'Post a picture'
  fill_in('Caption', with: caption)
  attach_file('Image', File.absolute_path("./spec/images/" + file_name), visible: false)
  click_button('Create Mewment')
end

def add_comment(text)
  visit '/mewments'
  click_link 'Comment'
  fill_in 'Message', with: text
  click_button 'Comment'
end

def edit_caption(caption)
  click_link 'Edit'
  fill_in 'Caption', with: caption
  click_button 'Update Mewment'
end
