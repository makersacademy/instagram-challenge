module FeatureSpecHelper
  def log_in
    user = User.create(username: "TestUser", email: "Test@example.com", password: "password")
    visit '/'
    fill_in "Email", with: "Test@example.com"
    fill_in "Password", with: "password"
    click_button "Log In"
  end

  def post_picture
    page.attach_file('post_image', './spec/fixtures/files/test_image.png')
    fill_in "post[caption]", with: "Test caption"
    click_button "Send"
  end

  def post_no_picture
    fill_in "post[caption]", with: "Test caption no pic"
    click_button "Send"
  end
end
