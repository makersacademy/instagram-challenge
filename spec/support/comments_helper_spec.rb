def post_comment
  click_link 'Post a comment...'
  fill_in 'Message', with: 'Arggh!'
  click_button 'Post comment'
end
