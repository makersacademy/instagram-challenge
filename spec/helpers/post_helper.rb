def create_post
  visit '/posts'
  click_link 'Add post'
  fill_in 'Description', with: 'One day on holiday!'
  click_button 'Create Post'
end
