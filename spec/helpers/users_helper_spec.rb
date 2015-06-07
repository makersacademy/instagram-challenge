require 'rails_helper'

module UsersHelper
  def sign_up(email, username, password)
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: email)
    fill_in('Username', with: username)
    fill_in('Password', with: password)
    fill_in('Password confirmation', with: password)
    click_button('Sign up')
  end

  def sign_in(login, password)
    visit('/')
    click_link('Sign in')
    fill_in('Login', with: login)
    fill_in('Password', with: password)
    click_button('Log in')
  end
end