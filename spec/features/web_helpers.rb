def sign_up(username: 'axeman',
            email: 'axeman@makers.com',
            password: 'testtest',
            password_confirmation: 'testtest')
  visit '/'
  click_link 'Sign up'
  fill_in 'Username', with: username
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  fill_in 'Password confirmation', with: password_confirmation
  click_button 'Sign up'
end

def add_photo
  click_link ('Share an experience')
  attach_file('Image', Rails.root + '/spec/fixtures/wolf_creek.jpg')
  fill_in "Description", with: "Heavan for powder hounds"
  click_button 'Post experience'
end
