require 'rails_helper'

  def sign_up(user)
    visit(new_user_registration_path)
    fill_in('Email', with: user.email)
    fill_in('Username', with: user.username)
    fill_in('Password', with: user.password)
    fill_in('Password confirmation', with: user.password)
    click_button('Sign up')
  end