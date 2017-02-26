module Helpers

  def visit_index
    @photo = FactoryGirl.create(:photo)
    visit photos_path
  end

  def user_sign_in(user)
    visit('/')
    click_link('Sign in')
    fill_in :user_email, with: user.email
    fill_in :user_password, with: user.password
    click_button "Log in"
  end

end
