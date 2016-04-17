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

def signup_user2
  visit '/images'
  click_link('Sign up')
  fill_in('Name', with: 'Test2 Name')
  fill_in('Username', with: 'Test2_user')
  fill_in('Email', with: 'test2@test.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end

def signout
  visit '/images'
  click_link('Sign out')
end

def upload_image1
  click_link('Upload new image')
  fill_in ('Name'), with: 'Test image'
  fill_in ('Description'), with: 'Test description'
  attach_file 'image[image]', Rails.root + 'spec/support/uploads/test_image.jpg'
  click_button('Upload image')
end

def leave_comment1
  click_link 'Comment'
  fill_in 'Comment', with: 'Wow what a great image'
  click_button 'Leave comment'
  expect(page).to have_content('Wow what a great image')
  expect(current_path).to eq('/')
end