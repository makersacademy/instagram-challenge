def add_post
  visit '/posts'
  click_link 'Add a post'
  fill_in 'Caption', with: 'Beautiful day'
  click_button 'Post'
end
