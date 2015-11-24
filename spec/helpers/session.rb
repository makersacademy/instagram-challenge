module SessionHelpers
  def sign_up(user)
    visit '/users/sign_up'
    fill_in :user_username, with: user.username
    fill_in :Email, with: user.email
    fill_in :user_password, with: user.password
    fill_in :user_password_confirmation, with: user.password_confirmation
    click_button 'Sign up'
  end

  def sign_in(email:, password:)
    visit '/users/sign_in'
    fill_in :Email, with: user.email
    fill_in :user_password, with: user.password
    click_button 'Sign in'
  end

  def add_image
    visit '/images/new'
    fill_in 'Name', with: 'Missing'
    attach_file(id="image_image", Rails.root + 'public/images/thumb/missing.png')
    click_button 'Create Image'
  end

  def add_comment
    visit '/images'
    click_link 'Add comment'
    fill_in 'Comment', with: 'nice pic'
    click_button 'Leave Comment'
  end

  def edit_image
    click_link 'Missing'
    click_link 'Edit image'
    fill_in 'Name', with: 'Test'
    click_button 'Update Image'
  end

  def delete_image
    click_link 'Missing'
    click_link 'Delete image'
  end
end
