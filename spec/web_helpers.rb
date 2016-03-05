module SessionHelpers

  def sign_up_and_in(email, password, user_name)
    visit('/')
    click_link('I Need InstaGratification')
    fill_in('User name', with: user_name)
    fill_in('Email', with: email)
    fill_in('Password', with: password)
    fill_in('Password confirmation', with: password)
    attach_file('user_profile_pic', 'spec/support/profile_pic_placeholder.jpg')
    click_button('I Need InstaGratification')
  end


  def sign_out
    click_link 'I\'ve Had Enough InstaGratification'
  end

end
