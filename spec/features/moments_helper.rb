def share_a_moment
  visit '/'
  click_link 'Share a moment'
  attach_file 'moment[image]', 'app/assets/images/Scissors_icon.png'
  fill_in 'Description', with: 'Something profound'
  click_button 'Share'
end

def add_a_comment
  find("#moment").click
  fill_in 'comment', with: 'That is profound'
  click_button 'Comment'
end
