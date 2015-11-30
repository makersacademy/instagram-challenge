module User_helpers
  def sign_up(email: "test@example.com",
              password: "testtest",
              password_confirmation: "testtest")
    visit('/')
    click_link('Sign up')
    fill_in(:user_email, with: email)
    fill_in(:user_password, with: password)
    fill_in(:user_password_confirmation, with: password_confirmation)
    click_button('Sign up')
  end

  def create_restaurant(description)
    visit("/restaurants")
    click_link("Creat Post")
    attach_file("post[image]", File.expand_path("./spec/test.jpg"))
    fill_in("Description", with: description)
    click_button("Create Post")
  end

  def sign_out
    click_link("Sign out")
  end

  def write_comment(thoughts)
    visit("/posts")
    click_link("Write a comment")
    fill_in("Thoughts", with: thoughts)
    click_button("Send")
  end
end