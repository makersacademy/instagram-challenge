module WebHelper
  def sign_in(email, password)
    visit '/'
    click_link 'Sign in'
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Log in'
  end

  def add_post(file_path, caption)
    visit '/'
    click_link 'Add post'
    attach_file 'Image', Rails.root.join(file_path)
    fill_in 'Caption', with: caption
    click_button 'Post'
  end

  def add_comment(comment)
    click_link "Comment"
    fill_in "comment_content", with: comment
    click_button "Enter"
  end
end
