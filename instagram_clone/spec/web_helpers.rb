def sign_up
  visit '/'
  click_link 'Sign up'
  fill_in 'Email', with: 'test@test.co.uk'
  fill_in 'User name', with: 'testname'
  fill_in('Password', with: 'testytest', :match => :prefer_exact)
  fill_in('Password confirmation', with: 'testytest', :match => :prefer_exact)
  click_button 'Sign up'
  p current_path
end

def create_post_two
  visit '/'
  click_link 'New Post'
  attach_file('Image', "spec/files/images/jungle.jpg")
  fill_in 'Caption', with: 'jungle party'
  click_button 'Create Post'
end



def create_post
  visit '/'
  click_link 'New Post'
  attach_file('Image', "spec/files/images/coffee.jpg")
  fill_in 'Caption', with: 'nom nom nom #coffeetime'
  click_button 'Create Post'
end
