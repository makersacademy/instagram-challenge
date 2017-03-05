

def sign_up
  visit('/')
  click_link('Register')
  fill_in('Username', with: 'testtest')
  fill_in('Email', with: 'test@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
  @user = User.find_by_email('test@example.com')
end

def create_post_with_image
  visit "/pictures/new"
  attach_file('picture[image]', Rails.root + 'spec/features/Mountains.jpg')
  fill_in "Description", with: "Bla blalbla "
  click_button "Post a picture"
end
