img = Rack::Test::UploadedFile.new('spec/files/pirates1.jpeg', 'image/jpg')

def sign_up_1
    visit '/'
    click_link 'Sign up'
    fill_in 'User name', with: 'Blackbeard'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: '12345678'
    fill_in 'Password confirmation', with: '12345678'
    click_button 'Sign up'
end

def sign_up_2
    visit '/'
    click_link 'Sign up'
    fill_in 'User name', with: 'Redbeard'
    fill_in 'Email', with: 'best@best.com'
    fill_in 'Password', with: '12345678'
    fill_in 'Password confirmation', with: '12345678'
    click_button 'Sign up'
end

def add_picture
  click_link 'Upload a picture...'
  fill_in 'Title', with: 'Pirate Party!'
  fill_in 'Caption', with: 'Ahoy!'
  attach_file 'Image', Rails.root.join('spec/files/pirates1.jpeg')
  click_button 'Create Picture'
end

def visit_picture
  visit '/pictures'
  click_link 'Pirate Party!'
end
