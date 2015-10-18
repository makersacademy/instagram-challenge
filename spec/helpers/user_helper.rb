module UserHelpers

  def sign_up(user)
    visit '/users/sign_up'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password
    click_button 'Sign up'
  end

  def add_photo
    click_link "Add a photo"
    fill_in 'Title', with: 'My cats'
    attach_file("photo[image]", "spec/assets/cats.jpg")
    click_button "Post photo"
  end

end
