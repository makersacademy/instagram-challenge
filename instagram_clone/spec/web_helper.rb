def sign_up
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: 'test@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end

def capybara
  visit '/pictures'
  click_link "Add a picture!"
  page.attach_file('picture_image', Rails.root + 'spec/capybara.jpg')
  fill_in "Caption", with: "This is a capybara"
  click_button "Upload Image"
end
