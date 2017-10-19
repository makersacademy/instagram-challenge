def sign_in_and_post
  user = create(:user)
  visit posts_url(as: user)
  click_on "Add new"
  fill_in "Title", with: "Hello, world!"
  attach_file('post_photo', Rails.root + "spec/factories/Trollface.png")
  click_button "Upload"
end
