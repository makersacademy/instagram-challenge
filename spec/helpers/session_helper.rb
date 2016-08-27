module SessionHelpers
  def sign_up
    visit '/'
    click_link 'Sign up'
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: 'testtest'
    fill_in 'Password confirmation', with: 'testtest'
    click_button 'Sign up'
  end

  def sign_up_another_user
    visit '/'
    click_link 'Sign up'
    fill_in 'Email', with: 'anotheruser@example.com'
    fill_in 'Password', with: 'testtest'
    fill_in 'Password confirmation', with: 'testtest'
    click_button 'Sign up'
  end

  def post_picture
    visit '/pictures'
    click_link 'Post a picture'
    attach_file 'picture[image]', Rails.root.join('spec','images','img.jpg')
    fill_in 'Caption', with: 'a nice picture'
    click_button 'Post picture'
  end

  def leave_comment
    visit '/pictures'
    find(:xpath, "//a/img[@alt='a nice picture']/..").click
    click_link 'Comment'
    fill_in 'Thoughts', with: 'it is a picture'
    click_button 'Leave comment'
  end
end