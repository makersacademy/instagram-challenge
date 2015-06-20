module SessionHelpers

  def sign_up(email, password, password_confirmation)
    visit '/pictures'
    click_link 'Sign up'
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: password_confirmation
    click_button 'Sign up'
  end

  def sign_in(email, password)
    visit '/pictures'
    click_link 'Sign in'
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Log in'
  end

  def attach_picture
      visit '/pictures'
      click_link 'Add a picture'
      attach_file 'Image', 'spec/features/Iceland.jpg'
      fill_in('Description', with: 'My lovely Iceland')
      click_button 'Create Picture'
    end
end