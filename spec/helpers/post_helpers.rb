def create_post(caption="Love my new trainers!")
  visit '/'
  click_link 'Add a post'
  fill_in("Caption", with: caption)
  page.attach_file('post_image', Rails.root + 'spec/fixtures/avatar.jpg')
  click_button 'Create Post'
end
