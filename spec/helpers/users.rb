module UserHelpers

  def signing_up_and_in
    visit '/pictures'
    click_link('Sign up')
    fill_in('Email', with: 'guillaume@makers.com')
    fill_in('Password', with: 'password')
    fill_in('Password confirmation', with: 'password')
    click_button('Sign up')
  end
end
