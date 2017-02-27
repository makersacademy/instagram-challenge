def sign_up
  visit "/"
  click_link('Sign up')
  fill_in('Email', with: 'test@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end

def upload_pic
  visit "/pictures/new"
  attach_file('picture[image]', Rails.root + 'spec/features/capy-little-large.jpg')
  click_button "Share Pic"
end
