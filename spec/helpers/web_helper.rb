def sign_up(email, password)
  visit '/'
  click_on 'Sign Up'
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  within ".submit-field" do
    click_on 'Sign up'
  end
end

def sign_in(email, password)
  visit '/'
  click_on 'Sign in'
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  within ".submit-field" do
    click_on 'Sign in'
  end
end

def post_image
  click_on 'New Fatcat'
  attach_file('Image', Rails.root + 'spec/test_images/download.jpeg')
  fill_in 'Caption', with: 'my fat cat'
  click_on 'Upload'
end