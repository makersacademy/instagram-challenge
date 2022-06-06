def add_photo
  visit '/photos/new'
  fill_in('photo_title', with: 'Beach')
  fill_in('photo_description', with: 'It\'s a very nice beach photo')
  attach_file("photo_photo", "spec/asset_specs/photos/photo.jpeg")
  click_button("Add Photo")
end

def sign_up
  visit '/users/sign_up'
  fill_in('user_email', with: 'antonio@uniplaces.com')
  fill_in('user_password', with: '123456')
  fill_in('user_password_confirmation', with: '123456')
  click_button("Sign up")
end
