module ApplicationHelper
  def create_post
    visit '/posts'
    click_link 'Add a post'
    attach_file('Image',"spec/files/images/googlelogo.png")
    fill_in 'Caption', with: 'google'
    click_button 'Create Post'
  end

  def sign_up(params = {
    email: "test@example.com",
    username: "test",
    password: "testtest",
    password_confirmation: "testtest" })

    visit('/users/sign_up')
    fill_in('Email', with: params[:email])
    fill_in('User name', with: params[:username])
    fill_in('Password', with: params[:password])
    fill_in('Confirm password', with: params[:password_confirmation])
    click_button('Sign up')
  end

  def log_in(params = {
    email: "sergio@gmail.com",
    password: "sergio" })

    visit('/users/sign_in')
    fill_in('Email', with: params[:email])
    fill_in('Password', with: params[:password])
    click_button('Log in')
  end
end