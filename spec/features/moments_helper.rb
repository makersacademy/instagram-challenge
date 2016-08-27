
def share_a_moment_signed_out
  visit '/'
  click_link 'Share a moment'
  attach_file 'moment[image]', 'app/assets/images/Scissors_icon.png'
  fill_in 'Description', with: 'Something profound'
  click_button 'Share'
end


def share_a_moment_signed_in
  sign_up
  click_link 'Share a moment'
  attach_file 'moment[image]', 'app/assets/images/Scissors_icon.png'
  fill_in 'Description', with: 'Something profound'
  click_button 'Share'
end

def add_a_comment
  click_link("moment")
  fill_in 'comment[comment]', with: 'That is profound'
  click_button 'Comment'
end
