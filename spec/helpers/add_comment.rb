def add_comment
  visit '/'
  fill_in 'Leave a comment', with: 'GRUMPY CAT!!'
  click_button 'Submit'
end