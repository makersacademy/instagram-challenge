def upload_post
  visit('/posts')
  click_link('Create a post')
  fill_in('Description', with: 'Beautiful view')
  click_button('Create Post')
end
