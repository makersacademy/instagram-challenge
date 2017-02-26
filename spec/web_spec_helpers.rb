def add_comment(text)
  click_link 'Leave comment'
  fill_in 'Thoughts', with: text
  click_button 'Comment'
end
