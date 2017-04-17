def leave_comment(thoughts)
  visit '/photos'
  click_link 'Comment'
  fill_in 'Thoughts', with: thoughts
  click_button 'Leave Comment'
end