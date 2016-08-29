def upload_image(description: "Test description",
                 picture_image: Rails.root + 'spec/images/Test.JPG')
  visit '/'
  click_link 'Upload a picture'
  fill_in 'Description', with: description
  page.attach_file("picture_image", picture_image)
  click_button 'Upload Picture'
end

def sign_up(name: 'Joe Bloggs',
            email: "test@gmail.com",
            password: "password123",
            password_confirmation: "password123")

visit '/'
click_link 'Sign up'
fill_in 'Name', with: name
fill_in 'Email', with: email
fill_in 'Password', with: password
fill_in 'Password confirmation', with: password_confirmation
click_button 'Sign up'
end
