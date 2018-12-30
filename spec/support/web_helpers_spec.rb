def sign_up(user)
  visit "/sign_up"
  within "#sign-up-form" do
    fill_in "user_first_name", with: user.first_name
    fill_in "user_last_name", with: user.last_name
    fill_in "user_username", with: user.username
    fill_in "user_email", with: user.email
    fill_in "user_password", with: user.password
    fill_in "user_password_confirmation", with: user.password
    click_button "Sign Up"
  end
end

def sign_in(user)
  visit "/sign_in"
  within "#sign-in-form" do
    fill_in "email", with: user.email
    fill_in "password", with: user.password
    click_button "Sign In"
  end
end

def post_photo
  visit "/posts"
  click_link "New Post"
  expect(current_path).to eq "/posts/new"
  fill_in "Caption", with: "This is my photo caption"
  attach_file("Image", Rails.root + "spec/fixtures/photo1.png")
  click_button "Post!"
end
