module FactoryHelper

  def sign_up(user)
    visit root_path
    click_link "Sign up"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    fill_in "Password confirmation", with: user.password_confirmation
    click_button "Sign up"
  end

  def sign_in(user)
    visit root_path
    click_link "Sign in"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
  end

  def request_forgotten_pass(user)
    click_link "Sign in"
    click_link "Forgot your password?"
    fill_in "Email", with: user.email
    click_button "Send me reset password instructions"
  end

  def create_post
    visit root_path
    click_link "Create post"
    fill_in "post[caption]", with: "test post!"
    click_button "Create Post"
  end

  def upload_picture
    visit root_path
    click_link "Create post"
    fill_in "post[caption]", with: "test post!"
    attach_file("post[image]", 
      Rails.root + "spec/fixtures/files/reset_5.png")
    click_button "Create Post"
  end

  def upload_picture_time_freeze
    Timecop.freeze(Time.now)
    visit root_path
    click_link "Create post"
    fill_in "post[caption]", with: "test post!"
    attach_file("post[image]", 
      Rails.root + "spec/fixtures/files/reset_5.png")
    click_button "Create Post"
  end

end
