def post_comment
  click_link 'Post a comment...'
  fill_in 'Message', with: 'Arggh!'
  fill_in 'Name', with: 'Blackbeard'
  click_link 'Post comment'
end
