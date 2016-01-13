module Helpers

  def sign_up(email, password)
    visit('/')
    click_link('Sign up')
    fill_in(:user_email, with: email)
    fill_in(:user_password, with: password)
    fill_in(:user_password_confirmation, with: password)
    click_button('Sign up')
  end

  def upload_picture(caption)
    click_link("New post")
    fill_in("Caption", with: caption)
    attach_file("picture[image]", File.expand_path("./spec/test.jpg"))
    click_button("Create Picture")
  end

  def sign_out
    click_link("Sign out")
  end

  def leave_a_comment(comment)
    fill_in('comment_thoughts', with: comment)
    click_button('comment!')
  end

end