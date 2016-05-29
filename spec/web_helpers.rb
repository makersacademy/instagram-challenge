def sign_up_user1
  visit '/'
  click_link 'Sign up'
  fill_in 'Email', with: 'hello@example.com'
  fill_in "Password", with: 'secret'
  fill_in "Password confirmation", with: 'secret'
  click_button 'Sign up'
end

def sign_up_user2
  visit '/'
  click_link 'Sign up'
  fill_in 'Email', with: 'example@hello.com'
  fill_in "Password", with: 'secret'
  fill_in "Password confirmation", with: 'secret'
  click_button 'Sign up'
end

def upload_photo
  visit '/photos'
  click_link 'Add an photo'
  fill_in "Caption", with: "Night sky"
  page.attach_file("photo[image]", Rails.root + 'spec/assets/images/night_sky.jpg')
  click_button "Create Photo"
end
