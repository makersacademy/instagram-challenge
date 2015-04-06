module Helpers
  def sign_in_helper(user_name = 'test@test.com')
    visit '/'
    click_link 'Sign up'
    fill_in('Email', with: user_name)
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
  end

  def add_image_helper(image_name = "at the beach" )
    visit '/posts'
    click_link "Add Image"
    fill_in "Name", with: image_name
    click_button "Add Image"
  end
end
