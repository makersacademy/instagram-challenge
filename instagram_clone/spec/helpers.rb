module Helpers

  def sign_up
    visit '/'
    click_link('Sign up')
    fill_in('Email', with: 'test@email.com')
    fill_in('Password', with: '12345678')
    fill_in('Password confirmation', with: '12345678')
    click_button('Register')
  end

  def sign_up_2
    visit '/'
    click_link('Sign up')
    fill_in('Email', with: 'kate@email.com')
    fill_in('Password', with: '12345678')
    fill_in('Password confirmation', with: '12345678')
    click_button('Register')
  end

  def upload_image
    visit '/'
    click_link('Upload an image')
    attach_file 'Picture', 'spec/images/cake.jpg'
    fill_in 'Name', with: 'Cake'
    click_button 'Add photo'
  end

  def leave_comment
    click_link 'Comment on Cake'
    fill_in "Comment", with: "yum!"
    click_button 'Leave Comment'
  end

end