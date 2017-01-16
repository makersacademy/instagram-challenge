def sign_up
  visit '/photos'
  click_link 'Sign up'
  fill_in 'Email', with: 'test@example.com'
  fill_in 'Password', with: 'testtest'
  fill_in 'Password confirmation', with: 'testtest'
  click_button 'Sign up'
end

def create_photo_post
  visit '/photos'
  click_link 'Add a photo'
  fill_in 'Title', with: 'Test photo'
  click_button 'Create Photo'
end
