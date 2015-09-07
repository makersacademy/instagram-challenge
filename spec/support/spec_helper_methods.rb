module SpecHelperMethods
  def sign_in_as(user)
    visit('/')
    click_link('Sign in')
    fill_in('Email', with: user.email)
    fill_in('Password', with: user.password)
    click_button('Log in')
  end
end
