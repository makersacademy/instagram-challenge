def signup_user1
  visit '/images'
  click_link('Sign up')
  fill_in('Name', with: 'Test Name')
  fill_in('Username', with: 'Test_user')
  fill_in('Email', with: 'test@test.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end


def upload_image1
  click_link('Upload new image')
  fill_in ('Name'), with: 'Test image'
  fill_in ('Description'), with: 'Test description'
  attach_file 'image[image]', Rails.root + 'spec/support/uploads/test_image.jpg'
  click_button('Upload image')
end
