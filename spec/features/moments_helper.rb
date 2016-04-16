def share_a_moment
  visit '/moments'
  click_link 'Share a moment'
  attach_file 'moment[image]', 'app/assets/images/Scissors_icon.png'
  fill_in 'Description', with: 'Something profound'
  click_button 'Share'
end
