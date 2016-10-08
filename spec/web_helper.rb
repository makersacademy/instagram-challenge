def add_post(caption, image)
  visit '/posts'
  click_link 'Add a post'
  fill_in 'Caption', with: caption
  page.attach_file('post_image', Rails.root + "public/images/#{image}")
  click_button 'Add'
end

def edit_post(caption)
  click_link 'Edit'
  fill_in 'Caption', with: caption
  click_button 'Update'
end
