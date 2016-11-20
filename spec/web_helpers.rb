def sign_up_sign_in
  visit '/'
  click_link 'Sign up'
  fill_in('Email', with: 'test@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end

def upload_picture
  click_link 'Post a picture'
  attach_file("Image", File.join(Rails.root + "spec/asset_specs/pictures/picture.jpg"))
  fill_in "Caption", with: 'Test caption'
  click_button "Create Picture"
end
