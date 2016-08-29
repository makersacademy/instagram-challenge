def create_comment(comment: 'Amazing')
  fill_in 'Comment', with: comment
  click_button 'Post'
end
