def create_post(caption="Love my new trainers!")
  visit '/'
  click_link 'Add a post'
  fill_in("Caption", with: caption)
  click_button 'Create Post'
end
