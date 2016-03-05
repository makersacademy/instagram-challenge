module SessionHelpers

  def sign_up_and_in(email, password)
    visit('/')
    click_link('I Need InstaGratification')
    fill_in('Email', with: email)
    fill_in('Password', with: password)
    fill_in('Password confirmation', with: password)
    click_button('I Need InstaGratification')
  end


  def sign_out
    click_link 'I\'ve Had Enough InstaGratification'
  end

end
