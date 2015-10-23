def leave_comment (thoughts)
  visit '/pictures'
  click_link 'Comment'
  fill_in "Thoughts", with: thoughts
  click_button 'Post'
end