def create_post
  visit '/posts'
  click_link 'New post'
  fill_in 'Title', with: 'First post'
  fill_in 'Description', with: 'great'
  click_button 'Create Post'
end
