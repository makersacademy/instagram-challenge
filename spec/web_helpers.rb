def sign_up
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: 'test@example.com')
  fill_in('Password', with: 'abcd1234')
  fill_in('Password confirmation', with: 'abcd1234')
  click_button('Sign up')
end

def upload_coffee_photo
  visit '/photos'
  click_link('Add a photo')
  fill_in 'Name', with: 'Posh Coffee'
  attach_file("photo[image]", Rails.root + "spec/fixtures/coffee.jpg")
  click_button('Create Photo')
end

def upload_cat_photo
  visit '/photos'
  click_link('Add a photo')
  fill_in 'Name', with: 'My adorable cat'
  attach_file("photo[image]", Rails.root + "spec/fixtures/cat.jpg")
  click_button('Create Photo')
end
