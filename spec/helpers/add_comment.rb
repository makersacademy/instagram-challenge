def add_comment
  visit '/'
  click_link 'Comment'
  fill_in 'Leave a comment', with: 'GRUMPY CAT!!'
  click_button 'Submit'
end