def upload_image
  visit("/pictures")
  click_link("Add a picture")
  fill_in("Name", with: "Quote 1")
  attach_file("picture[image]", Rails.root + "spec/fixtures/road.png")
  click_button("Upload")
end

def sign_up
  visit("/")
  click_link("Sign up")
  fill_in('Email', with: 'test@makers.com')
  fill_in("Password", with: "123456")
  fill_in("Password confirmation", with: "123456")
  click_button("Sign up")
end

def add_comment
  upload_image
  visit("/pictures")
  click_link("Comment on Quote 1")
  fill_in("Comment", with: "Nice Quote")
  click_button("Add comment")
end
